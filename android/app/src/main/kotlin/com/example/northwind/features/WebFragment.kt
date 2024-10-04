package com.example.northwind.features

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.northwind.LOGIN_URL
import com.example.northwind.R
import dev.hotwire.core.turbo.errors.HttpError
import dev.hotwire.core.turbo.errors.VisitError
import dev.hotwire.core.turbo.visit.VisitAction.REPLACE
import dev.hotwire.core.turbo.visit.VisitOptions
import dev.hotwire.navigation.destinations.HotwireDestinationDeepLink
import dev.hotwire.navigation.fragments.HotwireWebFragment

@HotwireDestinationDeepLink(uri = "northwind://fragment/web")
open class WebFragment : HotwireWebFragment() {
  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {

    val nav = this.navigator

    return inflater.inflate(R.layout.fragment, container, false)
  }

  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    setupMenu()
  }

  private fun setupMenu() {
    toolbarForNavigation()?.inflateMenu(R.menu.menu_custom)
    val item = toolbarForNavigation()?.menu?.findItem(R.id.menu_custom_item)
    item?.isVisible = true
  }

  override fun onVisitErrorReceived(location: String, error: VisitError) {
    if (error is HttpError.ClientError.Unauthorized) {
    navigator.route(LOGIN_URL, VisitOptions(action = REPLACE))
    } else {
      super.onVisitErrorReceived(location, error)
    }
  }
}