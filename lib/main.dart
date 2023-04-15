import 'package:flutter/material.dart';
import 'package:voice_assistant_with_chatgpt/views/pages/homePage/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
          // primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
