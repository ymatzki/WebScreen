import Foundation
import ScreenSaver
import WebKit

final class WebScreen: ScreenSaverView {

    private var webview: WKWebView!
    
	// MARK: - Properties

	private lazy var configurationWindowController: NSWindowController = {
		return PreferencesWindowController()
	}()

	// MARK: - Initializers

	convenience init() {
		self.init(frame: .zero, isPreview: false)
	}

	override init!(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)
		initialize()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		initialize()
	}

	
	// MARK: - NSView

    func createWebView(frame: NSRect, isPreview: Bool){
        //let url = NSURL(string: "https://apple.com")
        let url = NSURL(string: Preferences().urlName)
                
        let urlRequest = URLRequest(url: url! as URL)
        let config = WKWebViewConfiguration()
        
        webview = WKWebView(frame: frame, configuration: config)
        webview!.load(urlRequest)
        
        self.addSubview(webview)
    }

    override func startAnimation() {
        super.startAnimation()
        createWebView(frame: frame, isPreview: isPreview)
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
    }

	// MARK: - ScreenSaverView

	override func animateOneFrame() {
	}

    override var hasConfigureSheet: Bool {
        return true
    }

    override var configureSheet: NSWindow? {
        return configurationWindowController.window
    }


	// MARK: - Private

	private func initialize() {
		// Set animation time interval
		animationTimeInterval = 1 / 30
	}
}
