package com.example.northwind.features.web

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.view.menu.MenuBuilder
import androidx.core.view.MenuProvider
import androidx.lifecycle.Lifecycle
import com.example.northwind.R
import com.example.northwind.base.NavDestination
import com.example.northwind.util.BASE_URL
import com.example.northwind.util.LOGOUT_URL
import dev.hotwire.turbo.fragments.TurboFragment
import dev.hotwire.turbo.nav.TurboNavGraphDestination

@TurboNavGraphDestination(uri = "northwind://fragment/home")

class HomeFragment : TurboFragment(), NavDestination {
  @SuppressLint("UseRequireInsteadOfGet")
  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
    return inflater.inflate(R.layout.fragment_home, container, false)
  }

  @SuppressLint("ResourceType")
  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)

    val toolbar = view.findViewById<androidx.appcompat.widget.Toolbar>(R.id.toolbar)

    setButton(R.id.button_customers, "Customers")
    setButton(R.id.button_employees, "Employees")
    setButton(R.id.button_orders, "Orders")
    setButton(R.id.button_products, "Products")
    setButton(R.id.button_regions, "Regions")
    setButton(R.id.button_shippers, "Shippers")
    setButton(R.id.button_suppliers, "Suppliers")

    // Toolbar
    val menuProvider = object : MenuProvider {

      override fun onCreateMenu(menu: Menu, menuInflater: MenuInflater) {
        if (menu is MenuBuilder) menu.setOptionalIconsVisible(true)

        menuInflater.inflate(R.menu.menu_logout, menu)

        val item: MenuItem? = menu.findItem(R.id.logout_item)
        val vw = item?.actionView

        if(vw != null) {
          val itemText = vw.findViewById<TextView>(R.id.item_logout_text)
          itemText.setOnClickListener { v ->
            navigate(LOGOUT_URL)
          }
        }
      }

      override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
        return true
      }
    }

    toolbar.addMenuProvider(menuProvider, fragment.getViewLifecycleOwner(), Lifecycle.State.RESUMED)

  }

  private fun setButton(viewId: Int, text: String) {
    val buttonView = this.view?.findViewById<View>(viewId)
    val template = buttonView?.findViewWithTag<View>("button_template")
    val button = template as Button
    val url = "$BASE_URL/$text".lowercase()

    button.text = text
    button.setOnClickListener {
      navigate(url)
    }
  }

}
