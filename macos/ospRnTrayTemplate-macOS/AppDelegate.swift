//Author: Oscar Franco, created on: 23.05.20

import Foundation
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  var popover: NSPopover!
  var bridge: RCTBridge!
  var statusBarItem: NSStatusItem!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    let jsCodeLocation: URL

    jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource:nil)
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "ospRnTrayTemplate", initialProperties: nil, launchOptions: nil)
    let rootViewController = NSViewController()
    rootViewController.view = rootView

    popover = NSPopover()

    popover.contentSize = NSSize(width: 400, height: 600)
    popover.animates = true
    popover.behavior = .transient
    popover.contentViewController = rootViewController

    statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(80))

    if let button = self.statusBarItem.button {
        button.action = #selector(togglePopover(_:))
      button.title = "Deepr"
    }

  }

  @objc func togglePopover(_ sender: AnyObject?) {
      if let button = self.statusBarItem.button {
          if self.popover.isShown {
              self.popover.performClose(sender)
          } else {
              self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)

              self.popover.contentViewController?.view.window?.becomeKey()
          }
      }
  }
}
