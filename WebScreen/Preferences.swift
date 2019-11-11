import Foundation
import AppKit
import ScreenSaver

extension Notification.Name {
    static let PreferencesDidChange = Notification.Name(rawValue: "PreferencesDidChangeNotification")
}

final class Preferences: NSObject {
    
    // MARK: - Types
    private enum DefaultsKey: String {
        case url = "Url"

        var key: String {
            return rawValue
        }
    }
    
    // MARK: - Properties
    static let shared = Preferences()
    
    private let defaults: UserDefaults = ScreenSaverDefaults(
        forModuleWithName: Bundle(for: Preferences.self).bundleIdentifier!)!
    
    @objc var urlName: String {
        get {
            return defaults.string(forKey: DefaultsKey.url.key)!
        }

        set {
            defaults.set(newValue, forKey: DefaultsKey.url.key)
            save()
        }
    }
    
    // MARK: - Initializers

    override init() {
        defaults.register(defaults: [
            DefaultsKey.url.key: "https://apple.com"
        ])
    }
    
    // MARK: - Private
    
    private func save() {
        defaults.synchronize()
        NotificationCenter.default.post(name: .PreferencesDidChange, object: self)
    }
}

