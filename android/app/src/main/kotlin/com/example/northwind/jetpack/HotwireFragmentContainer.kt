package com.example.northwind.jetpack

import android.os.Bundle
import android.text.TextUtils.replace
import android.view.View
import androidx.compose.runtime.Composable
import androidx.compose.ui.viewinterop.AndroidView
import androidx.fragment.app.FragmentContainerView
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.commit
import com.example.northwind.features.FooFragment
import dev.hotwire.navigation.fragments.HotwireWebFragment

@Composable
fun HotwireFragmentContainer(supportFragmentManager : FragmentManager) {
  AndroidView(factory = { context ->

   val fragmentContainerViewId = View.generateViewId()

    // Create a FragmentContainerView programmatically
    val fragmentContainerView = FragmentContainerView(context).apply {
      id = fragmentContainerViewId // Assign the generated ID
    }

    // Attach the HotwireWebFragment
    supportFragmentManager.commit {
//      replace(fragmentContainerView.id, HotwireWebFragment().apply {
//        arguments = Bundle().apply {
//          putString("url", "https://example.com") // Set any arguments
//        }
//      })

      replace(fragmentContainerView.id, FooFragment().apply {
      })

    }

    fragmentContainerView
  })
}