import 'dart:async';

import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/assistant_repository.dart';
import '../domain/assistant_message.dart';

class AssistantConversation extends AutoDisposeAsyncNotifier<List<AssistantMessage>> {
  static const _tag = 'AssistantConversation';

  AssistantRepository get _assistantRepository => ref.watch(assistantRepositoryProvider);
  TimeUtil get _timeUtil => ref.watch(timeUtilProvider);
  UuidUtil get _uuidUtil => ref.watch(uuidUtilProvider);
  Logger get _logger => ref.watch(loggerProvider);

  @override
  FutureOr<List<AssistantMessage>> build() {
    return [
      ModelMessage(
        id: _uuidUtil.v4(),
        timestamp: _timeUtil.now(),
        text: "Hi! I'm Brina, your personal cocktail bartender. How can I help you today?",
        resources: const [],
      ),
    ];
  }

  Future<void> sendMessage(String message) async {
    _logger.info(_tag, 'sendMessage(message: $message)');

    final history = await future;

    state = AsyncData([
      ...history,
      UserMessage(
        id: _uuidUtil.v4(),
        timestamp: _timeUtil.now(),
        text: message,
      ),
    ]);

    final (reply, resources) = await _assistantRepository.sendMessage(message, history);
    final previousState = await future;

    state = AsyncData([
      ...previousState,
      ModelMessage(
        id: _uuidUtil.v4(),
        timestamp: _timeUtil.now(),
        text: reply,
        resources: resources,
      ),
    ]);
  }
}

final assistantConversationProvider =
    AsyncNotifierProvider.autoDispose<AssistantConversation, List<AssistantMessage>>(AssistantConversation.new);
