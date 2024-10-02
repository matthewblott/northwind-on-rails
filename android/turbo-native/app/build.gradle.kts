plugins {
  id("com.android.application") version "8.4.1"
  id("org.jetbrains.kotlin.android") version "1.9.0"
  id("org.jetbrains.kotlin.plugin.serialization") version "1.9.10"
}

buildscript {
  repositories {
    google()
    mavenCentral()
  }

}

android {
  namespace = "com.example.northwind"
  compileSdk = 34

  defaultConfig {
    minSdk = 34
  }

  buildFeatures {
    viewBinding = true
  }

  kotlinOptions {
    jvmTarget = JavaVersion.VERSION_18.toString()
  }

  compileOptions {
    sourceCompatibility = JavaVersion.VERSION_18
    targetCompatibility = JavaVersion.VERSION_18
  }

}

dependencies {
  implementation("androidx.appcompat:appcompat:1.7.0")
  implementation("androidx.browser:browser:1.8.0")
  implementation("androidx.constraintlayout:constraintlayout:2.1.4")
  implementation("com.google.android.flexbox:flexbox:3.0.0")
  implementation("dev.hotwire:strada:1.0.0-beta3")
  implementation("dev.hotwire:turbo:7.1.3")
  //noinspection GradleDependency
  implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.3")
}

repositories {
  google()
  mavenCentral()
}
