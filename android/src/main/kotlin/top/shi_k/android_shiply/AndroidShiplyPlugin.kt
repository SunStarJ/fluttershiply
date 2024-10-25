package top.shi_k.android_shiply

import android.content.Context
import androidx.annotation.NonNull
import com.google.gson.Gson
import com.tencent.upgrade.bean.UpgradeConfig
import com.tencent.upgrade.bean.UpgradeStrategy
import com.tencent.upgrade.callback.UpgradeStrategyRequestCallback

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AndroidShiplyPlugin */
class AndroidShiplyPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_shiply")
        channel.setMethodCallHandler(this)
        this.context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "initShiply" -> {
                val configBuilder = UpgradeConfig.Builder()
                call.arguments<Map<String, String>>()?.let { args ->
                    val config = configBuilder.appId(args["appId"]).appKey(args["appKey"]).build()
                    com.tencent.upgrade.core.UpgradeManager.getInstance()
                        .init(context.applicationContext, config)
                }
                result.success(1)
            }

            "checkUpdate" -> {
                com.tencent.upgrade.core.UpgradeManager.getInstance()
                    .checkUpgrade(false, null, object : UpgradeStrategyRequestCallback {
                        override fun onReceiveStrategy(p0: UpgradeStrategy?) {
                            result.success(Gson().toJson(p0))
                        }

                        override fun onFail(p0: Int, p1: String?) {
                            result.error(p0.toString(), p1, null)
                        }

                        override fun onReceivedNoStrategy() {
                            result.error((-1).toString(), "onReceivedNoStrategy", null)
                        }

                    })
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
