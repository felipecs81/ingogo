import 'package:ingogo/helpers/socket_helper.dart';
import 'package:ingogo/utils/app_utils.dart';
import 'package:web_socket_channel/io.dart';

class SocketHelper implements ISocketHelper {

  IOWebSocketChannel? _socket;

  @override
  void connectSocket({required Function(dynamic) onMessage}) async {
    _socket = IOWebSocketChannel.connect( Uri.parse('wss://ws.postman-echo.com/raw'));
    _socket?.stream.listen((event) {
      AppUtils.printInfo('Event received: $event');
      onMessage(event);
    });
  }

  @override
  void emit(dynamic data) {
    if (_socket != null) {
      _socket?.sink.add(data);
      return;
    }
    AppUtils.printInfo('Chat is disconnected');
  }

  @override
  void disconnectSocket() {
    _socket?.sink.close();
    _socket = null;
  }
}