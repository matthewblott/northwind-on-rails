package com.example.northwind.components

import android.util.Log
import dev.hotwire.core.bridge.BridgeComponent
import dev.hotwire.core.bridge.BridgeDelegate
import dev.hotwire.core.bridge.Message
import dev.hotwire.navigation.destinations.HotwireDestination
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

open class ButtonComponent(
  name: String,
  private val delegate: BridgeDelegate<HotwireDestination>
) : BridgeComponent<HotwireDestination>(name, delegate) {

  override fun onReceive(message: Message) {
    // Handle incoming messages based on the message `event`.
    when (message.event) {
      "connect" -> handleConnectEvent(message)
      else -> Log.w("ButtonComponent", "Unknown event for message: $message")
    }
  }

  private fun handleConnectEvent(message: Message) {
    val data = message.data<MessageData>() ?: return

    // Write native code to display a native submit button in the
    // toolbar displayed in the delegate.destination. Use the
    // incoming data.title to set the button title.
  }

  private fun performButtonClick(): Boolean {
    return replyTo("connect")
  }

  // Use kotlinx.serialization annotations to define a serializable
  // data class that represents the incoming message.data json.
  @Serializable
  data class MessageData(
    @SerialName("title") val title: String
  )
}
