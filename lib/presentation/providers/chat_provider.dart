import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yesno_app/config/helpers/yes_no_answer.dart';
import 'package:yesno_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final YesNoAnswer getYesNoAnswer = YesNoAnswer();
  List<Message> messageList = [
    Message(text: 'Hi! are you ok?', fromWho: FromWho.me),
    Message(text: 'can you suck it?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
    // * usage of .endwith to detect the final of a string
    if (text.endsWith('?')) {
      herReply();
    } else {
      return;
    }
    // * the notifyListeners acts like a setState, this tell the listener to re-render

    // Here we make the animation after the message is sent
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // this allow the message to delay few miliseconds for the scroll to happen
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        // position.maxScrollExtent goes to the max it can scroll
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        // animation of the scroll
        curve: Curves.easeOut);
  }
}
