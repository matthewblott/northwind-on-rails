import UIKit
import HotwireNative
import WebKit

class SceneDelegate: UIResponder  {
  var window: UIWindow?
  private lazy var navigator = Navigator(pathConfiguration: pathConfiguration, delegate: self)
  private let rootURL = URL(string: "http://localhost:3000")!
  private let navigationController = UINavigationController()
  let viewController = WebViewController()
  
  private func configureBridge() {
    Hotwire.registerBridgeComponents([
      CustomButton.self,
      DeleteButton.self,
      EditButton.self,
      LinkTo.self,
      NewButton.self,
      SaveButton.self,
    ])
  }

  private func configureRootViewController() {
    guard let window = window else {
      fatalError()
    }
    window.rootViewController = navigator.rootViewController
  }

  private lazy var pathConfiguration = PathConfiguration(sources: [
    .file(Bundle.main.url(forResource: "path-configuration", withExtension: "json")!),
  ])
}

extension SceneDelegate: UIWindowSceneDelegate {
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    UINavigationBar.configureWithOpaqueBackground()
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    window = UIWindow(windowScene: windowScene)
    window?.makeKeyAndVisible()

    configureBridge()
    configureRootViewController()

    navigator.route(rootURL)
  }

}

extension SceneDelegate: NavigatorDelegate {
  func handle(proposal: VisitProposal) -> ProposalResult {
    return .acceptCustom(HotwireWebViewController(url: proposal.url))
  }
}
