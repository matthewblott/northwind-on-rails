package com.example.northwind.jetpack

import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview

@Composable
fun MyText(name: String) {
  Text(text = "Hello $name!")
}

@Preview
@Composable
fun FooScreen() {
  MyText("Matt")
}
