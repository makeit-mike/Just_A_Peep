//
//  AppDelegate.swift
//  Just_A_Peep
//
//  Created by Michael Jones on 1/30/22.
//

import Foundation
import SwiftUI


class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBarItem: NSStatusItem?
    static var shared : AppDelegate!
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let contentView = ContentView()

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.behavior = .transient
        popover.animates = false
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        popover.contentViewController?.view.window?.makeKey()
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusBarItem?.button?.title = "Take a peep"
        statusBarItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
    }

    @objc func showPopover(_ sender: AnyObject?) {
        if let button = statusBarItem?.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    @objc func closePopover(_ sender: AnyObject?) {
        popover.performClose(sender)
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}
