import { BridgeComponent } from "@hotwired/strada"
import { BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  // This must be the same name as the argument passed to the BridgeComponentFactory constructor 
  static component = "control-group"
  // It is not necessary to create all target elements for Turbo Bridge to work
  static targets = [ "item1", "item2", "item3", "item4", "item5", "item6" ]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  getTitle(targets) {
    if(targets.length === 0) {
      return ""
    }
    const element = targets[0]
    const control = new BridgeElement(element)
    return control.title
  } 

  notifyBridgeOfConnect() {
    const title1 = this.getTitle(this.item1Targets) 
    const title2 = this.getTitle(this.item2Targets) 
    const title3 = this.getTitle(this.item3Targets) 
    const title4 = this.getTitle(this.item4Targets) 
    const title5 = this.getTitle(this.item5Targets) 
    const title6 = this.getTitle(this.item6Targets) 

    this.send("connect", { title1, title2, title3, title4, title5, title6 }, (e) => {
      const data = e.data
      const menuItemId = data.menu_item

      switch (menuItemId) {
        case 1:
          this.item1Target.click()
          break                  
        case 2:
          this.item2Target.click()
          break
        case 3:
          this.item3Target.click()
          break
        case 4:
          this.item4Target.click()
          break
        case 5:
          this.item5Target.click()
          break
        case 6:
          this.item6Target.click()
          break
        default:
          break
      }
    })

  }

}
