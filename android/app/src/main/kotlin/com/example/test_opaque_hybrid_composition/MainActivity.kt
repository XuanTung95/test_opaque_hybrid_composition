package com.example.test_opaque_hybrid_composition

import io.flutter.embedding.android.FlutterActivity
import android.widget.FrameLayout
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode
import io.flutter.embedding.android.RenderMode

class MainActivity: FlutterActivity() {
    override fun getBackgroundMode(): BackgroundMode {
        return BackgroundMode.transparent;
    }

    /*
    override fun getRenderMode(): RenderMode {
        return RenderMode.surface;
    }
    */
}
