package app.felipehernandez.com.flutterappdrawer

import android.annotation.TargetApi
import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  @TargetApi(Build.VERSION_CODES.LOLLIPOP)
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    //Modificacion para quitar la estatus bar de Android by felipe
    this.getWindow().setStatusBarColor(android.graphics.Color.TRANSPARENT);
  }
}
