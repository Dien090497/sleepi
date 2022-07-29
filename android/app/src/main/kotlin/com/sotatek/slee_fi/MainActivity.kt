package com.sotatek.slee_fi

import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.ActivityNotFoundException
import android.content.ContentResolver
import android.content.Intent
import java.io.File
import android.widget.Toast
import androidx.core.content.FileProvider

class MainActivity : FlutterActivity() {
    private var methodResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(messenger, "com.sotatek.sleepfi.sharing")
                .setMethodCallHandler { call, result ->
                    methodResult = result
                    val path = call.arguments as? String
                    when (call.method) {
                        "shareFacebook" -> {
                            path?.let {
                                this.shareImageWithFacebook(it)
                            }
                        }
                        "shareTwitter" -> {
                            path?.let {
                                this.shareImageWithTwitter(it)
                            }
                        }
                        "shareInstagram" -> {
                            path?.let {
                                this.shareImageWithInstagram(it)
                            }
                        }
                        else -> result.success("Error")
                    }
                }

    }

    private fun shareImageWithFacebook(imagePath: String) {
        try {
            val intent = getShareIntent(TypeIntent.Facebook, imagePath)
            startActivity(Intent.createChooser(intent, "Share.."))
        } catch (e: ActivityNotFoundException) {
            this.methodResult?.apply {
                this.success("Error")
            }
        }
    }

    private fun shareImageWithTwitter(imagePath: String) {
        try {
            val intent = getShareIntent(TypeIntent.Twitter, imagePath)
            startActivity(Intent.createChooser(intent, "Share.."))
        } catch (e: ActivityNotFoundException) {
            this.methodResult?.apply {
                this.success("Error")
            }
        }
    }

    private fun getUriWithFile(file: File): Uri {
        return FileProvider.getUriForFile(
                this,
                BuildConfig.APPLICATION_ID + ".provider",
                file)
    }

    private fun shareImageWithInstagram(imagePath: String) {
        try {
            val intent = getShareIntent(TypeIntent.Instagram, imagePath)
            startActivity(Intent.createChooser(intent, "Share.."))
        } catch (e: ActivityNotFoundException) {
            print(e.message)
            this.methodResult?.apply {
                this.success("Error")
            }
        }
    }

    private fun getShareIntent(type: TypeIntent, path: String): Intent {
        val shareIntent = Intent(Intent.ACTION_SEND)
        shareIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        val uri = this.getUriWithFile(File(path))
        shareIntent.type = "image/png"
        shareIntent.putExtra(Intent.EXTRA_STREAM, uri);
        when (type) {
            TypeIntent.Facebook -> {
                shareIntent.setPackage("com.facebook.katana") //Facebook App package
            }
            TypeIntent.Twitter -> {
                shareIntent.setPackage("com.twitter.android")
            }
            TypeIntent.Instagram -> {
                shareIntent.setPackage("com.instagram.android")
            }
        }
        return shareIntent
    }

    enum class TypeIntent {
        Twitter, Instagram, Facebook
    }

}
