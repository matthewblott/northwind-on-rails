package com.example.northwind.components

import android.util.Log
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.core.view.MenuProvider
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import com.example.northwind.R
import com.google.android.material.appbar.AppBarLayout
import com.google.android.material.appbar.MaterialToolbar
import dev.hotwire.core.bridge.BridgeComponent
import dev.hotwire.core.bridge.BridgeDelegate
import dev.hotwire.core.bridge.Message
import dev.hotwire.navigation.destinations.HotwireDestination
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

open class CustomButton(
  name: String,
  private val delegate: BridgeDelegate<HotwireDestination>,
) : BridgeComponent<HotwireDestination>(name, delegate) {

  private val fragment: Fragment
    get() = delegate.destination.fragment
  private val appbar: AppBarLayout?
    get() = fragment.view?.findViewById(R.id.app_bar)

  override fun onReceive(message: Message) {
    when (message.event) {
      "connect" -> handleConnectEvent(message)
      else -> Log.w("TurboDemo", "Unknown event for message: $message")
    }

  }

  private fun handleConnectEvent(message: Message) {
    val data = message.data<MessageData>() ?: return
    showToolbarButton(data)
  }

  private fun showToolbarButton(data: MessageData) {
    val menuProvider = object : MenuProvider {
      override fun onCreateMenu(menu: Menu, menuInflater: MenuInflater) {
        val item: MenuItem? = menu.findItem(R.id.menu_custom_item)

        if(item != null ) {
          menu.removeItem(R.id.menu_custom_item)
        }

        menuInflater.inflate(R.menu.menu_custom, menu)

        val item0 = menu.findItem(R.id.menu_custom_item)

        item0.title = data.title
      }

      override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
          R.id.menu_custom_item -> {
            return replyTo("connect")
          }
          else -> false
        }
      }
    }

   val toolbar = appbar?.getChildAt(0) as? MaterialToolbar

    toolbar?.addMenuProvider(menuProvider, fragment.getViewLifecycleOwner(), Lifecycle.State.RESUMED)
  }

  @Serializable
  data class MessageData(
    // Must be the same name as the argument passed to the send method of the Stimulus controller
    @SerialName("title") val title: String
  )
}
