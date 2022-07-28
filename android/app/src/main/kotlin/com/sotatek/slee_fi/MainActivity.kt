package com.sotatek.slee_fi

import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.ActivityNotFoundException
import android.content.Intent
import java.io.File
import com.facebook.share.model.SharePhotoContent
import com.facebook.share.model.SharePhoto
import android.graphics.BitmapFactory
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
                            Toast.makeText(this, it, Toast.LENGTH_SHORT).show()
                            this.shareImageWithFacebook(it)
                        }
                    }
                    "shareTwitter" -> {
                        path?.let {
                            Toast.makeText(this, it, Toast.LENGTH_SHORT).show()
                            this.shareImageWithTwitter(it)
                        }
                    }
                    "shareInstagram" -> {
                        path?.let {
                            Toast.makeText(this, it, Toast.LENGTH_SHORT).show()
                            this.shareImageWithInstagram(it)
                        }
                    }
                    else -> result.success("Error")
                }
            }

    }

    private fun shareImageWithFacebook(imagePath: String) {
        val imgFile = File(imagePath)

        if (imgFile.exists()) {
            val myBitmap = BitmapFactory.decodeFile(imgFile.absolutePath)
            val photo: SharePhoto = SharePhoto.Builder()
                .setBitmap(myBitmap)
                .build()

            SharePhotoContent
                .Builder()
                .addPhoto(photo)
                .build()
        } else {
            this.methodResult?.apply {
                this.success("Error")
            }
        }
    }

    private fun shareImageWithTwitter(imagePath: String) {
        try {
            val file = File(imagePath)
            val uri = getUriWithFile(file)
            print(" ========> ${uri.path}")
            val intent = getShareIntent(TypeIntent.Twitter, uri)
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
                BuildConfig.APPLICATION_ID + "." + localClassName + ".provider",
                file)
    }

    private fun shareImageWithInstagram(imagePath: String) {
        try {
            val file = File(imagePath)
            val uri = getUriWithFile(file)
            val intent = getShareIntent(TypeIntent.Instagram, uri)
            startActivity(Intent.createChooser(intent, "Share.."))
        } catch (e: ActivityNotFoundException) {
            print(e.message)
            this.methodResult?.apply {
                this.success("Error")
            }
        }
    }

    private fun getShareIntent(type: TypeIntent, uriImage: Uri): Intent {
        val shareIntent = Intent(Intent.ACTION_SEND)
        shareIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        shareIntent.type = "image/*"
        shareIntent.putExtra(Intent.EXTRA_STREAM, uriImage)
        when (type) {
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
        Twitter, Instagram
    }

}
