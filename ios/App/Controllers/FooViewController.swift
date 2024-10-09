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
  // This is called when the view controller's view is loaded into memory
  override func viewDidLoad() {
      super.viewDidLoad()
      
      // Set the background color of the view
      view.backgroundColor = .white
      
      // Create a label and add it to the view
      let label = UILabel()
      label.text = "Hello, World!"
      label.textColor = .black
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(label)
      
      // Center the label in the view using Auto Layout constraints
      NSLayoutConstraint.activate([
          label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
  }
}
