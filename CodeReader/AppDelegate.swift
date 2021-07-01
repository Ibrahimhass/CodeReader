//   MIT License
//
// Copyright (c) 2021 Md Ibrahim Hassan
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

