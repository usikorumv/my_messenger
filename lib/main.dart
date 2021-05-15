import 'package:flutter/material.dart';
import 'package:messenger/Pages/start_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger_US',
      debugShowCheckedModeBanner: false, // Отключаем баннер
      home: StartPage(),
    );
  }
}
