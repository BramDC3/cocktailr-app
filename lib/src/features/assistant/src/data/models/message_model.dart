import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sender_model.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel extends Equatable {
  const MessageModel({
    required this.text,
    required this.sender,
  });

  final String text;
  final SenderModel sender;

  @override
  List<Object?> get props => [
        text,
        sender,
      ];

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
