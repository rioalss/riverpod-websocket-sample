abstract class WebsocketException implements Exception {
  final String message;
  final DateTime timestamp;

  WebsocketException(this.message) : timestamp = DateTime.now();

  @override
  String toString() => 'WebsocketException: $message';
}

class WebsocketConnectionException extends WebsocketException {
  WebsocketConnectionException(String message) : super(message);
}

class WebSocketChannelException extends WebsocketException {
  WebSocketChannelException(String message) : super(message);
}

class WebsocketTimeoutException extends WebsocketException {
  WebsocketTimeoutException(String message) : super(message);
}

class WebsocketInvalidUrlException extends WebsocketException {
  WebsocketInvalidUrlException(String message) : super(message);
}

class WebsocketNotConnectedException extends WebsocketException {
  WebsocketNotConnectedException(String message) : super(message);
}

class WebsocketSendException extends WebsocketException {
  WebsocketSendException(String message) : super(message);
}
class WebsocketSubscriptionException extends WebsocketException {
  WebsocketSubscriptionException(String message) : super(message);
}

class WebsocketReceiveException extends WebsocketException {
  WebsocketReceiveException(String message) : super(message);
}

class WebsocketSerializationException extends WebsocketException {
  WebsocketSerializationException(String message) : super(message);
}

class WebsocketPayloadTooLargeException extends WebsocketException {
  WebsocketPayloadTooLargeException(String message) : super(message);
}

class WebsocketInvalidMessageException extends WebsocketException {
  WebsocketInvalidMessageException(String message) : super(message);
}

class WebsocketMessageProcessingException extends WebsocketException {
  WebsocketMessageProcessingException(String message) : super(message);
}

class WebsocketConnectionClosedException extends WebsocketException {
  WebsocketConnectionClosedException(String message) : super(message);
}
