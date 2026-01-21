import 'package:equatable/equatable.dart';



class MessageEntity extends Equatable {
  final String? input;
  final int? timestamp;

  const MessageEntity({
    this.input,
    this.timestamp,
  });

  @override
  List<Object?> get props => [input, timestamp];
}
