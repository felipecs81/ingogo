package au.com.felipe.ingogo

import android.util.Log
import org.java_websocket.client.WebSocketClient
import org.java_websocket.handshake.ServerHandshake
import java.lang.Exception
import java.net.URI

private const val TAG = "SocketUtils"

class SocketUtils(val onMessageReceived:(String?) -> Unit, val onConnect:() -> Unit, val onDisconnect:() -> Unit,
                  val onConnectError:() -> Unit) : WebSocketClient(URI("wss://ws.postman-echo.com/raw")) {

    override fun onOpen(handshakedata: ServerHandshake?) {
        Log.i(TAG, "Connected")
        onConnect()
    }

    override fun onMessage(message: String?) {
        Log.i(TAG, "OnMessage $message")
        onMessageReceived(message)
    }

    override fun onClose(code: Int, reason: String?, remote: Boolean) {
        Log.i(TAG, "Disconnected $reason")
        onDisconnect()
    }

    override fun onError(ex: Exception?) {
        Log.i(TAG, "Error $ex")
        onConnectError()
    }

    fun connectSocket() {
        connect()
    }

    fun disconnectSocket(){
        close()
    }

    fun sendMessage(message: String?){
        if(this.isOpen){
            send(message)
        }
    }
}