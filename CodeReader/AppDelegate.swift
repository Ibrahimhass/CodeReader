//
//  AppDelegate.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 27/06/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menuHistory: NSMenuItem!
    private var menuItems: [MenuItem] = []
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        for window in NSApplication.shared.windows {
            window.standardWindowButton(.zoomButton)?.isEnabled = false
        }
        refreshMenuBar()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func refreshMenuBar() {
        menuHistory.submenu?.items.removeAll()
        self.menuItems = Persistance().retrieve() ?? []
        
        for (index, item) in menuItems.enumerated() {
            let subItem = NSMenuItem()
            subItem.tag = index
            subItem.title = item.title
            subItem.action = #selector(AppDelegate.subItemSelected)
            menuHistory.submenu?.addItem(subItem)
        }
    }
    
    @objc func subItemSelected(_ sender: NSMenuItem) {
        ClipBoardManager().copy(text: menuItems[sender.tag].content)
    }
}

