// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      text: json['text'] as String,
      sender: $enumDecode(_$SenderModelEnumMap, json['sender']),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'sender': _$SenderModelEnumMap[instance.sender]!,
    };

const _$SenderModelEnumMap = {
  SenderModel.user: 'user',
  SenderModel.model: 'model',
};
