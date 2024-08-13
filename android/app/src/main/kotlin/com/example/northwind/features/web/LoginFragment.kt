package com.example.northwind.features.web

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import com.example.northwind.R
import com.example.northwind.main.MainActivity
import dev.hotwire.turbo.nav.TurboNavGraphDestination

@TurboNavGraphDestination(uri = "northwind://fragment/login")
class LoginFragment : BaseFragment() {
  lateinit var toolbar : androidx.appcompat.widget.Toolbar

  @SuppressLint("UseRequireInsteadOfGet")
  override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
    toolbar = this.activity?.findViewById(R.id.toolbar)!!
    return inflater.inflate(R.layout.fragment_login, container, false)
  }

}