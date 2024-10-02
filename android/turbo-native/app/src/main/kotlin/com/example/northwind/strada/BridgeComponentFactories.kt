package com.example.northwind.strada

import dev.hotwire.strada.BridgeComponentFactory

val bridgeComponentFactories = listOf(
  // Must be the same name as the Stimulus static component
  BridgeComponentFactory("control-group", ::ControlGroup),
  BridgeComponentFactory("custom", ::CustomButton),
  BridgeComponentFactory("delete", ::DeleteButton),
  BridgeComponentFactory("edit", ::EditButton),
  BridgeComponentFactory("link-to", ::LinkTo),
  BridgeComponentFactory("new", ::NewButton),
  BridgeComponentFactory("save", ::SaveButton),
)