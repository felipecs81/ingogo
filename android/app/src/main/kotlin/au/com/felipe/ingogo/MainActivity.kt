package au.com.felipe.ingogo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodChannel

private const val CHANNEL = "au.ingogo/channel"

class MainActivity: FlutterActivity() {

    private var socket: SocketUtils? = null

    //Sinks for socket events
    private var onConnectSocketEvent: EventSink? = null
    private var onDisconnectSocketEvent: EventSink? = null
    private var onSocketErrorEvent: EventSink? = null
    private var onSocketMessageEvent: EventSink? = null

    private fun initSocket(){
        socket = SocketUtils({
            runOnUiThread {
                onSocketMessageEvent?.success(it)
            }
        },{
            runOnUiThread {
                onConnectSocketEvent?.success(true)
            }
        },{
            runOnUiThread {
                onDisconnectSocketEvent?.success(false)
            }
        },{
            runOnUiThread {
                onSocketErrorEvent?.success(false)
            }
        })
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "connectSocket" -> {
                    initSocket()
                    socket?.connectSocket()
                    result.success(true)
                }
                "disconnectSocket" -> {
                    socket?.disconnectSocket()
                    socket = null
                    result.success(true)
                }
                "sendMessage" -> {
                    socket?.sendMessage(call.argument("message"))
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "onConnectSocket").setStreamHandler(
            object: StreamHandler {
                override fun onListen(arguments: Any?, es: EventSink) {
                    onConnectSocketEvent = es
                }
                override fun onCancel(arguments: Any?) {
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "onDisconnectSocket").setStreamHandler(
            object: StreamHandler {
                override fun onListen(arguments: Any?, es: EventSink) {
                    onDisconnectSocketEvent = es
                }
                override fun onCancel(arguments: Any?) {
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "onSocketError").setStreamHandler(
            object: StreamHandler {
                override fun onListen(arguments: Any?, es: EventSink) {
                    onSocketErrorEvent = es
                }
                override fun onCancel(arguments: Any?) {
                }
            }
        )

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "onSocketMessage").setStreamHandler(
            object: StreamHandler {
                override fun onListen(arguments: Any?, es: EventSink) {
                    onSocketMessageEvent = es
                }
                override fun onCancel(arguments: Any?) {
                }
            }
        )
    }
}
