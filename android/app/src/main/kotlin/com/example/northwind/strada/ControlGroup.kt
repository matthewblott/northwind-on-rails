package com.example.northwind.strada

import android.util.Log
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.appcompat.widget.Toolbar
import androidx.core.view.MenuProvider
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.navigation.ui.onNavDestinationSelected
import com.example.northwind.R
import com.example.northwind.base.NavDestination
import dev.hotwire.strada.BridgeComponent
import dev.hotwire.strada.BridgeDelegate
import dev.hotwire.strada.Message
import dev.hotwire.turbo.R.*
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

open class ControlGroup (
  name: String,
  private val delegate: BridgeDelegate<NavDestination>,
) : BridgeComponent<NavDestination>(name, delegate) {
  private val fragment: Fragment
    get() = delegate.destination.fragment
  private val toolbar: Toolbar?
    get() = fragment.view?.findViewById(R.id.toolbar)

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
        menuInflater.inflate(R.menu.menu_control_group, menu)

        if(data.title1 != "") {
          configureMenuItem(menu, R.id.menu_item_1, data.title1)
        }
        if(data.title2 != "") {
          configureMenuItem(menu, R.id.menu_item_2, data.title2)
        }
        if(data.title3 != "") {
          configureMenuItem(menu, R.id.menu_item_3, data.title3)
        }
        if(data.title4 != "") {
          configureMenuItem(menu, R.id.menu_item_4, data.title4)
        }
        if(data.title5 != "") {
          configureMenuItem(menu, R.id.menu_item_5, data.title5)
        }
        if(data.title6 != "") {
          configureMenuItem(menu, R.id.menu_item_6, data.title6)
        }
      }

      fun configureMenuItem(menu : Menu, id : Int, title : String){
        val item: MenuItem? = menu.findItem(id)
        if(item != null ) {
          menu.removeItem(id)
        }
        menu.add(Menu.NONE, id, Menu.NONE, title)
      }

      override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
          R.id.menu_item_1 -> {
            return replyTo("connect", "{ \"menu_item\": 1}" )
          }
          R.id.menu_item_2 -> {
            return replyTo("connect", "{ \"menu_item\": 2}" )
          }
          R.id.menu_item_3 -> {
            return replyTo("connect", "{ \"menu_item\": 3}" )
          }
          R.id.menu_item_4 -> {
            return replyTo("connect", "{ \"menu_item\": 4}" )
          }
          R.id.menu_item_5 -> {
            return replyTo("connect", "{ \"menu_item\": 5}" )
          }
          R.id.menu_item_6 -> {
            return replyTo("connect", "{ \"menu_item\": 6}" )
          }
          else -> false
        }
      }
    }
    toolbar?.addMenuProvider(menuProvider, fragment.getViewLifecycleOwner(), Lifecycle.State.RESUMED)
  }

  @Serializable
  data class MessageData(
    // Must be the same name as the argument passed to the send method of the Stimulus controller
    @SerialName("title1") val title1: String,
    @SerialName("title2") val title2: String,
    @SerialName("title3") val title3: String,
    @SerialName("title4") val title4: String,
    @SerialName("title5") val title5: String,
    @SerialName("title6") val title6: String,
  )
}