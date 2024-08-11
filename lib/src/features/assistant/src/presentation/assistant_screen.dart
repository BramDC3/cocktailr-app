import 'package:cocktailr/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/assistant_conversation.dart';
import '../domain/assistant_message.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.royal300,
      body: const SafeArea(
        child: _BodyBuilder(),
      ),
    );
  }
}

class _BodyBuilder extends ConsumerWidget {
  const _BodyBuilder();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversation = ref.watch(assistantConversationProvider);

    return conversation.when(
      data: (messages) => _Body(messages: messages),
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  final List<AssistantMessage> messages;

  const _Body({
    required this.messages,
  });

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = chat_ui.DarkChatTheme(
      backgroundColor: context.royal300,
      inputBackgroundColor: context.royal200,
    );

    const user = types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    );

    const model = types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ad',
      firstName: 'Brina',
      imageUrl: 'https://cdn-icons-png.freepik.com/512/2245/2245443.png',
    );

    final messages = widget.messages
        .map((message) {
          return switch (message) {
            UserMessage() => types.TextMessage(
                author: user,
                createdAt: message.timestamp.millisecondsSinceEpoch,
                id: message.id,
                text: message.text,
              ),
            ModelMessage() => types.TextMessage(
                author: model,
                createdAt: message.timestamp.millisecondsSinceEpoch,
                id: message.id,
                text: message.text,
              )
          };
        })
        .toList()
        .reversed
        .toList();

    return chat_ui.Chat(
      messages: messages,
      onSendPressed: (partialText) async {
        setState(() => _isLoading = true);
        await ref.read(assistantConversationProvider.notifier).sendMessage(partialText.text);
        if (mounted) {
          setState(() => _isLoading = false);
        }
      },
      user: user,
      showUserAvatars: true,
      showUserNames: true,
      theme: theme,
      typingIndicatorOptions: chat_ui.TypingIndicatorOptions(
        typingUsers: _isLoading ? [model] : [],
      ),
    );
  }
}
