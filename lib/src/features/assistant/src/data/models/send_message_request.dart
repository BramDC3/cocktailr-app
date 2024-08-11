import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_model.dart';

part 'send_message_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SendMessageRequest extends Equatable {
  final String newMessage;
  final List<MessageModel> history;

  const SendMessageRequest({
    required this.newMessage,
    required this.history,
  });

  @override
  List<Object?> get props => [
        newMessage,
        history,
      ];

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);
}
