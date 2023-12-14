
package com.example.sih_23_audiometer

import android.content.Context
import android.media.AudioManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Existing Flutter setup code here

        // Add platform-specific code
        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            "com.example.volume_control"
        ).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            if (call.method == "adjustVolume") {
                val change = call.argument<Int>("change")
                adjustVolume(change ?: 0)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun adjustVolume(change: Int) {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager?

        audioManager?.let {
            val currentVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC)
            val maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC)

            val newVolume = currentVolume.coerceIn(0, maxVolume) + change
            audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, newVolume, 0)
        }
    }
}
