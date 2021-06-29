//
//  ClipboardManager.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 29/06/21.
//

import Cocoa

class ClipBoardManager {
    
    func copy(text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
    
}
