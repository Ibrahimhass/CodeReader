//
//  ViewController.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 27/06/21.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var visualEffectView: NSVisualEffectView!
    @IBOutlet var mainView: NSGradientView!
    @IBOutlet weak var pickedImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet var dragView: ADragDropView!
    @IBOutlet weak var convertButton: NSButton!
    @IBOutlet weak var activityIndicator: NSProgressIndicator!
    
    private var outputText: String = ""
    
    private var pickedImagesUrls: [URL] = []
    
    override func viewWillAppear() {
        super.viewWillAppear()
        activityIndicator.isHidden = true
        activityIndicator.controlTint = .graphiteControlTint
        checkAndActivateConvertButton()
    }
    
    private func checkAndActivateConvertButton() {
        convertButton.isEnabled = !pickedImagesUrls.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.wantsLayer = true
        dragView.delegate = self
        setUpWindowSize()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func convertTapped(_ sender: NSButton) {
        if let imageUrl = pickedImagesUrls.last,
           let image = NSImage.init(contentsOf: imageUrl) {
            activityIndicator.isHidden = false
            activityIndicator.startAnimation(nil)
            ImageAnalyser().analyseImage(image: image, completion: { text in
                self.pickedImagesUrls = []
                self.activityIndicator.isHidden = true
                self.outputText = text
                self.showDailog()
            })
        }
    }
    
    func showDailog() {
        let copyAlert: NSAlert = NSAlert()
        copyAlert.messageText = "Code has been Converted"
        copyAlert.informativeText = "The image code has been converted"
        copyAlert.addButton(withTitle: "Copy")
        copyAlert.alertStyle = NSAlert.Style.informational

        if let window = self.view.window {
            copyAlert.beginSheetModal(for: window, completionHandler: { (modalResponse: NSApplication.ModalResponse) -> Void in
                if(modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn){
                    self.copyTappedAndSave()
                }
            })
        }
    }
    
    private func copyTappedAndSave() {
        ClipBoardManager().copy(text: self.outputText)
        Persistance().save(self.outputText)
        refreshMenuBar()
        prepareForNextConversion()
    }
    
    private func refreshMenuBar() {
        if let appDelegate = NSApplication.shared.delegate as? AppDelegate {
            appDelegate.refreshMenuBar()
        }
    }
    
    private func prepareForNextConversion() {
        visualEffectView.isHidden = false
        titleLabel.stringValue = "Drop an image to convert its source code to text"
        pickedImageView.image = nil
        convertButton.title = "Convert"
        checkAndActivateConvertButton()
    }
}


//MARK: - Styling
extension ViewController {
    private func setUpWindowSize() {
        self.view.window?.setFrame(NSRect(x:0,y:0,width: 480,height: 272), display: true)
        self.preferredContentSize = NSMakeSize(480, 272)
        let button = view.window?.standardWindowButton(NSWindow.ButtonType.zoomButton)
        button?.isEnabled = false
    }
}

extension ViewController: ADragDropViewDelegate {
    // when one file is dropped
    func dragDropView(_ dragDropView: ADragDropView, droppedFileWithURL URL: URL) {
        pickedImagesUrls.append(URL)
        pickedImageView.image = NSImage(contentsOf: URL)
        pickedImageView.imageScaling = .scaleProportionallyDown
        visualEffectView.isHidden = true
        checkAndActivateConvertButton()
    }
    
    // when multiple files are dropped
    func dragDropView(_ dragDropView: ADragDropView, droppedFilesWithURLs URLs: [URL]) {
        pickedImagesUrls = URLs
    }
}
