import { BridgeComponent } from "@hotwired/strada"
import { BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  // This must be the same name as the argument passed to the BridgeComponentFactory constructor 
  static component = "supplier-menu"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const submitButton = new BridgeElement(this.submitTarget)
    const title = submitButton.title

    this.send("connect", { title }, () => {
      this.submitTarget.click()
    })

  }

}
