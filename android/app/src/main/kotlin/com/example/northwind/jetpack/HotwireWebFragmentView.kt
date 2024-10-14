package com.example.northwind.jetpack

import android.os.Bundle
import android.text.TextUtils.replace
import androidx.compose.runtime.Composable
import androidx.compose.ui.viewinterop.AndroidView
import androidx.fragment.app.FragmentContainerView
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.commit
import com.example.northwind.features.FooFragment
import com.example.northwind.features.HomeFragment
import dev.hotwire.navigation.fragments.HotwireWebFragment

@Composable
fun HotwireWebFragmentView(fragmentManager: FragmentManager) {
  AndroidView(factory = { context ->
    // Create a FragmentContainerView programmatically
    val fragmentContainerView = FragmentContainerView(context).apply {
      id = androidx.fragment.R.id.fragment_container_view_tag // Give it an ID
    }

    // Attach the HotwireWebFragment
    fragmentManager.commit {
      replace(fragmentContainerView.id, HotwireWebFragment().apply {
        arguments = Bundle().apply {
          putString("url", "https://example.com") // Set any arguments
        }
      })

      replace(fragmentContainerView.id, FooFragment().apply {
      })
    }

    fragmentContainerView
  })
}