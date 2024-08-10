import 'package:equatable/equatable.dart';

sealed class AssistantMessage extends Equatable {
  final String id;
  final String text;
  final DateTime timestamp;

  const AssistantMessage({
    required this.text,
    required this.id,
    required this.timestamp,
  });

  @override
  List<Object> get props => [
        text,
        id,
        timestamp,
      ];
}

class UserMessage extends AssistantMessage {
  const UserMessage({
    required super.id,
    required super.text,
    required super.timestamp,
  });
}

class ModelMessage extends AssistantMessage {
  final List<String> resources;

  const ModelMessage({
    required super.id,
    required super.text,
    required super.timestamp,
    required this.resources,
  });

  @override
  List<Object> get props => [
        ...super.props,
        resources,
      ];
}
