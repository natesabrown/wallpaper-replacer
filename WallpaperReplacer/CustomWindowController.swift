import AppKit

class CustomWindowController: NSWindowController {

  override func windowDidLoad() {

    // Set the initial frame.
    setFrame()

    // Register for changes to screen parameters. (For example, when a user plugs in a monitor.)
    // This will allow the wallpaper to dynamically be shown correctly on the main screen.
    NotificationCenter.default.addObserver(
      forName: NSApplication.didChangeScreenParametersNotification,
      object: NSApplication.shared,
      queue: .main
    ) { [weak self] notification in

      self?.setFrame()
    }
  }

  func setFrame() {
    // Extend window past the notch (if applicable).
    window?.toggleFullScreen(self)
    if let frame = NSScreen.main?.frame {
      window?.setFrame(frame, display: true)
    }
  }
}
