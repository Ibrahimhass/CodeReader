// The MIT License (MIT)
//
// Copyright (c) 2018 Axel Kee
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Cocoa

public final class ADragDropView: NSView {
    
    // highlight the drop zone when mouse drag enters the drop view
    fileprivate var highlight : Bool = false
    
    // check if the dropped file type is accepted
    fileprivate var fileTypeIsOk = false
    
    
    /// Allowed file type extensions to drop, eg: ["png", "jpg", "jpeg"]
    public var acceptedFileExtensions : [String] = ["png", "jpg", "jpeg"]
    
    public weak var delegate: ADragDropViewDelegate?
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        if #available(OSX 10.13, *) {
            registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
        } else {
            // Fallback on earlier versions
            registerForDraggedTypes([NSPasteboard.PasteboardType("NSFilenamesPboardType")])
        }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    // MARK: - NSDraggingDestination
    public override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        highlight = true
        fileTypeIsOk = isExtensionAcceptable(draggingInfo: sender)
        
        self.setNeedsDisplay(self.bounds)
        return []
    }
    
    public override func draggingExited(_ sender: NSDraggingInfo?) {
        highlight = false
        self.setNeedsDisplay(self.bounds)
    }
    
    public override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy : []
    }
    
    public override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        // finished with dragging so remove any highlighting
        highlight = false
        self.setNeedsDisplay(self.bounds)
        
        return true
    }
    
    public override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        if sender.filePathURLs.count == 0 {
            return false
        }
        
        if(fileTypeIsOk) {
            if sender.filePathURLs.count == 1 {
                delegate?.dragDropView(self, droppedFileWithURL: sender.filePathURLs.first!)
            } else {
                delegate?.dragDropView(self, droppedFilesWithURLs: sender.filePathURLs)
            }
        } else {
            
        }
        
        return true
    }
    
    fileprivate func isExtensionAcceptable(draggingInfo: NSDraggingInfo) -> Bool {
        if draggingInfo.filePathURLs.count == 0 {
            return false
        }
        
        for filePathURL in draggingInfo.filePathURLs {
            let fileExtension = filePathURL.pathExtension.lowercased()
            
            if !acceptedFileExtensions.contains(fileExtension){
                return false
            }
        }
        
        return true
    }
    
    public override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return true
    }
}

public protocol ADragDropViewDelegate: AnyObject {
    func dragDropView(_ dragDropView: ADragDropView, droppedFileWithURL  URL: URL)
    func dragDropView(_ dragDropView: ADragDropView, droppedFilesWithURLs URLs: [URL])
}

extension ADragDropViewDelegate {
    func dragDropView(_ dragDropView: ADragDropView, droppedFileWithURL  URL: URL) {
    }
    
    func dragDropView(_ dragDropView: ADragDropView, droppedFilesWithURLs URLs: [URL]) {
    }
}
