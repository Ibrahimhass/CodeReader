//
//  ViewController.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 27/06/21.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var pickedImageView: NSImageView!
    @IBOutlet var mainView: NSView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet var dragView: ADragDropView!
    @IBOutlet weak var convertButton: NSButton!
    private var pickedImagesUrls: [URL] = []
    
    @IBAction func convertTapped(_ sender: NSButton) {
        if let imageUrl = pickedImagesUrls.last,
           let image = NSImage.init(contentsOf: imageUrl) {
            titleLabel.stringValue = "Converting"
            ImageAnalyser().analyseImage(image: image, completion: {
                self.pickedImagesUrls = []
                self.checkAndActivateConvertButton()
                self.titleLabel.stringValue = "Converted code has been copied to the clipboard"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.titleLabel.stringValue = "Drop an image to convert its source code to text"
                })
            })
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        checkAndActivateConvertButton()
    }
    
    private func checkAndActivateConvertButton() {
        convertButton.isHidden = pickedImagesUrls.isEmpty
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
}


//MARK: - Styling
extension ViewController {
    private func setUpWindowSize() {
        self.view.window?.setFrame(NSRect(x:0,y:0,width: 480,height: 272), display: true)
        self.preferredContentSize = NSMakeSize(480, 272)
        let button = view.window?.standardWindowButton(NSWindow.ButtonType.zoomButton)
        button?.isEnabled = false
    }
    
    private func customizeButton() {
        convertButton.wantsLayer = true
        convertButton.layer?.backgroundColor = NSColor.green.cgColor
    }
}

extension ViewController: ADragDropViewDelegate {
    // when one file is dropped
    func dragDropView(_ dragDropView: ADragDropView, droppedFileWithURL URL: URL) {
        pickedImagesUrls.append(URL)
        pickedImageView.image = NSImage(contentsOf: URL)
        pickedImageView.imageScaling = .scaleAxesIndependently
        titleLabel.stringValue = "Click the convert button to convert this image to code. To try another image drag another image."
        checkAndActivateConvertButton()
    }
    
    // when multiple files are dropped
    func dragDropView(_ dragDropView: ADragDropView, droppedFilesWithURLs URLs: [URL]) {
        pickedImagesUrls = URLs
    }
}
