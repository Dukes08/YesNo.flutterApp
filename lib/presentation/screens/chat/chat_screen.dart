import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesno_app/domain/entities/message.dart';
import 'package:yesno_app/presentation/providers/chat_provider.dart';
import 'package:yesno_app/presentation/widgets/chat/future_message_bubble.dart';
import 'package:yesno_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesno_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://mybackdrop.co.uk/wp-content/uploads/2017/06/space-galaxy.jpg'),
        ),
        title: const Text('Future'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.future)
                      ? FutureMessageBubble(
                          text: message.text,
                          img: message.img!,
                        )
                      : MyMessageBubble(
                          text: message.text,
                        );
                },
              ),
            ),

            //* value is what the person wrote
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
