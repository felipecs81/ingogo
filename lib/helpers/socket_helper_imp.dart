import 'package:flutter/services.dart';
import 'package:ingogo/helpers/socket_helper.dart';

class SocketHelper implements ISocketHelper {

  final platform = const MethodChannel('au.ingogo/channel');

  final onSocketMessageEvent = const EventChannel('onSocketMessage');

  @override
  void connectSocket({required Function(dynamic) onMessage}) async {
    //Setup listeners
    onSocketMessageEvent.receiveBroadcastStream().listen(onMessage);
    //Connect socket
    await platform.invokeMethod('connectSocket');
  }

  @override
  void emit(dynamic data) {
    platform.invokeMethod('sendMessage', {"message": data});
  }

  @override
  void disconnectSocket() async {
    await platform.invokeMethod('disconnectSocket');
  }
}