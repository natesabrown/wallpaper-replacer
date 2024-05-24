import AppKit

class CustomWindowController: NSWindowController {

    override func windowDidLoad() {
        // Extend window past the notch (if applicable).
        window?.toggleFullScreen(self)
        if let frame = NSScreen.main?.frame {
            window?.setFrame(frame, display: true)
        }
    }
}
