//
//  AppDelegate.swift
//  KakuteiShinkoku
//
//  Created by Takuya Mukohira on 2018/01/24.
//  Copyright © 2018年 Takuya Mukohira. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem = NSStatusBar.system.statusItem(withLength: -1)
    var kakuteiCount = 0
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let menu = NSMenu()
        self.statusItem.highlightMode = true
        self.statusItem.title = "確定申告[\(self.kakuteiCount)]"
        self.statusItem.menu = menu
        
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown, handler: {(evt: NSEvent!) -> Void in
            //print("Global Keydown: " + evt.characters! + " (" + String(evt.keyCode) + ")")
            if evt.keyCode == 36 {
                self.kakuteiCount += 1
                self.statusItem.title = "確定申告[\(self.kakuteiCount)]"
            }
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func quit(sender: NSButton) {
        NSApplication.shared.terminate(self)
    }
}

