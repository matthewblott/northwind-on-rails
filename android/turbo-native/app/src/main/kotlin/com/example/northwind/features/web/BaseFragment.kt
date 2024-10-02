package com.example.northwind.features.web

import android.os.Bundle
import android.view.View
import com.example.northwind.base.NavDestination
import com.example.northwind.strada.bridgeComponentFactories
import dev.hotwire.strada.BridgeDelegate
import dev.hotwire.turbo.fragments.TurboWebFragment
import dev.hotwire.turbo.views.TurboWebView

open class BaseFragment : TurboWebFragment(), NavDestination {
  private val bridgeDelegate by lazy {
    BridgeDelegate(
      location = location,
      destination = this,
      componentFactories = bridgeComponentFactories
    )
  }

  override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    viewLifecycleOwner.lifecycle.addObserver(bridgeDelegate)
  }

  override fun onDestroyView() {
    super.onDestroyView()
    viewLifecycleOwner.lifecycle.removeObserver(bridgeDelegate)
  }

  override fun onColdBootPageStarted(location: String) {
    bridgeDelegate.onColdBootPageStarted()
  }

  override fun onColdBootPageCompleted(location: String) {
    bridgeDelegate.onColdBootPageCompleted()
  }

  override fun onWebViewAttached(webView: TurboWebView) {
    bridgeDelegate.onWebViewAttached(webView)
  }

  override fun onWebViewDetached(webView: TurboWebView) {
    bridgeDelegate.onWebViewDetached()
  }
}