import Strada

extension BridgeComponent {
  nonisolated static var allTypes: [BridgeComponent.Type] {
    [
      CustomButton.self,
      DeleteButton.self,
      EditButton.self,
      LinkTo.self,
      NewButton.self,
      SaveButton.self,
    ]
  }
}
