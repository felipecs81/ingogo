abstract class ISocketHelper {
  void connectSocket({required Function(dynamic) onMessage});
  void emit(dynamic data);
  void disconnectSocket();
}