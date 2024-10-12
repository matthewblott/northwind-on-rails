import HotwireNative
import UIKit

class FooViewController: UIViewController, PathConfigurationIdentifiable {
  static var pathConfigurationIdentifier: String { "foo" }
  private var url: URL!
  private unowned var navigator: Router?
  
  convenience init(url: URL, navigator: Router) {
    self.init(nibName: nil, bundle: nil)
    self.url = url
    self.navigator = navigator
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    view.backgroundColor = .white
      
    let label = UILabel()
    
    label.text = "Hello, World!"
    label.textColor = .black
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
      
    view.addSubview(label)
      
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
