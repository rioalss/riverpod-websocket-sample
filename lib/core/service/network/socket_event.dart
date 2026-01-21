import 'package:example_websocket/core/error/websocket_exceptions.dart';

sealed class SocketEvent<T> {
  const SocketEvent();
}

class SocketData<T> extends SocketEvent<T> {
  final T data;
  const SocketData(this.data);
}

class SocketError<T> extends SocketEvent<T> {
  final WebsocketException error;
  const SocketError(this.error);
}
