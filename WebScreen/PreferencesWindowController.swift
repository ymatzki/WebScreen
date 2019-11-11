import AppKit

final class PreferencesWindowController: NSWindowController {

	// MARK: - NSWindowController

	override var windowNibName: String {
		return "Preferences"
	}


	// MARK: - Action

	@IBAction func close(_ sender: Any?) {
		window?.close()
	}
}
