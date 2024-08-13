import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "delete"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const title = 'Delete'

    this.send("connect", { title }, () => {
      this.submitTarget.click()
    })

  }

}
