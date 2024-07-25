import 'package:flutter/material.dart';
import 'package:yesno_app/config/theme/app_theme.dart';
import 'package:yesno_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen());
  }
}
