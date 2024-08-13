import { BridgeComponent } from "@hotwired/strada"
import { BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  // This must be the same name as the argument passed to the BridgeComponentFactory constructor (Android)
  static component = "link-to"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const submitButton = new BridgeElement(this.submitTarget)
    const title = submitButton.title
    
    this.send("connect", { title }, (e) => {
      const data = e.data
      console.log(data)
      this.submitTarget.click()
    })

  }

}
