import 'package:example_websocket/domain/entities/chat/message_entity.dart';
import 'package:example_websocket/features/chat/providers/chat_status_notifier.dart';
import 'package:example_websocket/features/chat/state/chat_state.dart';
import 'package:example_websocket/features/chat/widget/chat_input_widget.dart';
import 'package:example_websocket/features/chat/widget/error_banner_widget.dart';
import 'package:example_websocket/features/chat/widget/status_badge_widget.dart';
import 'package:example_websocket/features/coinbase/state/coinbase_status_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;
      if (bottomInset > 0) {
        _scrollToBottom();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  String extractMessage(MessageEntity data) {
    return data.input ?? '';
  }

  String extractTimestamp(MessageEntity data) {
    if (data.timestamp is int) {
      final dt = DateTime.fromMillisecondsSinceEpoch(
        ((data.timestamp ?? 0) * 1000),
      );
      return dt.toLocal().toString();
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatStatusProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text('Centrifuge Chat'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: state.when(
          initial: () => const Center(
            child: Text('Waiting for connection...'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (messages, status) {
            return _data(status, messages);
          },
          error: (message, cachedData) {
            String lastMessage = cachedData?.isEmpty ?? true
                ? ''
                : extractMessage(cachedData!.last);
            return _error(message, cachedData, lastMessage);
          },
        ),
      ),
      bottomNavigationBar: ChatInputWidget(
        textEditingController: _textController,
        onSend: _onSubmitMessage,
      ),
    );
  }

  void _onSubmitMessage() {
    ref.read(chatStatusProvider.notifier).sendMessage(_textController.text);
    _textController.clear();
    Future.delayed(
      const Duration(milliseconds: 300),
      () => _scrollToBottom(),
    );
  }

  Padding _error(
      String message, List<MessageEntity>? cachedData, String lastMessage) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErrorBannerWidget(message),
          const SizedBox(height: 16),
          if (cachedData != null) ...[
            const Text(
              'Last received data:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  lastMessage,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Column _data(ConnectionStatus status, List<MessageEntity> messages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: StatusBadgeWidget(status),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              final message = extractMessage(msg);
              final time = extractTimestamp(msg);

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (time.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            time,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
