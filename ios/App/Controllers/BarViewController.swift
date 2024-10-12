import Foundation
import SwiftUI
import HotwireNative

class BarViewController: UIHostingController<BarView> {
  static var pathConfigurationIdentifier: String { "bar" }
  convenience init(url: URL) {
    let view = BarView()
    self.init(rootView: view)
  }
  
}
