import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  // This must be the same name as the argument passed to the BridgeComponentFactory constructor 
  static component = "save"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const title = 'Save'

    this.send("connect", { title }, () => {
      this.submitTarget.click()
    })

  }

}
