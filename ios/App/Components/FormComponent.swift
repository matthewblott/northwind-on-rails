import Strada
//import Foundation
import UIKit

final class FormComponent: BridgeComponent {
    override class var name: String { "form" }
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }
    
    // Handle incoming messages based on the message `event`.
    override func onReceive(message: Message) {
        switch message.event {
        case "connect":
            handleConnectEvent(message: message)
        case "disconnect":
            viewController?.navigationItem.rightBarButtonItem = nil
        default:
            print("Sorry no matching message")
        }
    }

    private func handleConnectEvent(message: Message) {
        guard let data: MessageData = message.data() else { return }
        configureBarButton(with: data.submitTitle)
    }

    private func configureBarButton(with title: String) {
        let item = UIBarButtonItem(title: title,
                                   style: .plain,
                                   target: self,
                                   action: #selector(performAction))

//        viewController?.navigationItem.rightBarButtonItem = item
      viewController?.navigationItem.leftBarButtonItem = item
    }

    // Reply to the originally received "connect" event message (without any new data).
    @objc func performAction() {
        viewController?.navigationItem.rightBarButtonItem = nil
        reply(to: "connect")
    }
}

private extension FormComponent {
    struct MessageData: Decodable {
        let submitTitle: String
    }
}
