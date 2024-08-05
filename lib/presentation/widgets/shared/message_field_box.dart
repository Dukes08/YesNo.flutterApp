import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //* to maintain the focus after an enter the FocusNode is used
    final focusNode = FocusNode();
    final textController = TextEditingController();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with "?"',
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          //! This works but it is not the way it should be beacuse the state does not render on time
          // chatProvider.messageList.add(
          //   Message(text: textController.text, fromWho: FromWho.me),
          // );
          //! This works but is not the best way to implement the method.
          final textValue = textController.text;
          textValue.isEmpty ? '' : onValue(textValue);

          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
