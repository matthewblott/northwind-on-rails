import Strada
import UIKit

final class CustomButton: BridgeComponent {
  override class var name: String { "custom" }

  override func onReceive(message: Message) {
    guard let viewController else { return }
    addButton(via: message, to: viewController)
  }

  private var viewController: UIViewController? {
    delegate.destination as? UIViewController
  }

  private func addButton(via message: Message, to viewController: UIViewController) {
    guard let data: MessageData = message.data() else { return }

    let action = UIAction { [unowned self] _ in
      self.reply(to: "connect")
    }
    let item = UIBarButtonItem(title: data.title,  primaryAction: action)

    viewController.navigationItem.rightBarButtonItem = item
  }
}

private extension CustomButton {
  struct MessageData: Decodable {
    let title: String
  }
}

