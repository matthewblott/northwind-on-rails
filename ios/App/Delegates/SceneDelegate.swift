import UIKit
import Turbo
import WebKit
import Strada

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  private let navigationController = UINavigationController()
  let viewController = WebViewController()
  
  private lazy var session: Session = {
    let webView = WKWebView(frame: .zero, configuration: .appConfiguration)

    if #available(iOS 16.4, *) {
      webView.isInspectable = true
    }
    
    Bridge.initialize(webView)
    
    let session = Session(webView: webView)
    
    session.delegate = self
    
    return session
  }()

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    UINavigationBar.configureWithOpaqueBackground()
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    visit(url: URL(string: "http://localhost:3000")!)
  }

  private func visit(url: URL) {
    let controller = WebViewController()
    controller.visitableURL = url
    navigationController.pushViewController(controller, animated: true)
    // session.visit(controller, options: proposal.options)
    // session.visit(controller, action: VisitAction.advance)
    session.visit(controller)
  }

}

extension SceneDelegate: SessionDelegate {
  func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
    visit(url: proposal.url)
  }
    
  func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
    print("didFailRequestForVisitable: \(error)")
  }
    
  func sessionWebViewProcessDidTerminate(_ session: Session) {
    session.reload()
  }
}
