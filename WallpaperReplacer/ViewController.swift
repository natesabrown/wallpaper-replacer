import Cocoa
import SwiftUI

class ViewController: NSViewController {

    override func viewWillAppear() {

        // This window should inhabit the device's full screen size.
        if let mainScreen = NSScreen.main {
            let frame = mainScreen.frame
            self.view.window?.setFrame(frame, display: false)
        }

        // Hide the top bar.
        self.view.window?.titleVisibility = .hidden
        self.view.window?.titlebarAppearsTransparent = true

        self.view.window?.styleMask.insert(.fullSizeContentView)
        self.view.window?.styleMask.remove([.closable, .fullScreen, .miniaturizable, .resizable])

        // Prevent movement.
        self.view.window?.isMovable = false

        // This view can appear anywhere, in the background.
        self.view.window?.collectionBehavior.insert([.canJoinAllSpaces, .canJoinAllApplications, .ignoresCycle])

        // This will prevent it from going to the top and being selected. Not sure how reliable this is.
        self.view.window?.level = .normal - 1

        self.view.window?.hasShadow = false

        // Make it square. https://github.com/lukakerr/NSWindowStyles
        let visualEffect = NSVisualEffectView()
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.state = .active
        visualEffect.wantsLayer = true
        self.view.window?.styleMask.remove(.titled)
        self.view.window?.isMovableByWindowBackground = true
        self.view.window?.contentView?.addSubview(visualEffect)

        // Add the wallpaper image.
        if let bounds = self.view.window?.contentView?.bounds {
            let imageView = NSHostingController(rootView: WallpaperImage())
            self.view.addSubview(imageView.view)
            imageView.view.frame = bounds
        }
    }

    override func viewDidAppear() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

struct WallpaperImage: View {

    var body: some View {
        Image("sample")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

