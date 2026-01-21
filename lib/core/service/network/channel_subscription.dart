typedef ChannelMapper<T> = T Function(Map<String, dynamic> json);

class ChannelSubscription<T> {
  final String channel;
  final ChannelMapper<T> mapper;

  ChannelSubscription({
    required this.channel,
    required this.mapper,
  });
}
