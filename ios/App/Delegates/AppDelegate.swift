import UIKit
import HotwireNative

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      Hotwire.config.backButtonDisplayMode = .minimal
      Hotwire.config.showDoneButtonOnModals = true

      #if DEBUG
      Hotwire.config.debugLoggingEnabled = true
      #endif

      return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
}
