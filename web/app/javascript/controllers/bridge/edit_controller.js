import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "edit"
  static targets = [ "submit" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const title = 'Edit'

    this.send("connect", { title }, () => {
      this.submitTarget.click()
    })

  }

}
