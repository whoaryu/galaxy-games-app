import 'package:flutter/material.dart';
import 'package:galaxy_games/GameInfoScreen.dart';
import 'package:galaxy_games/MainMenu.dart';
import 'package:galaxy_games/WordCookiesScreen.dart';
import 'package:galaxy_games/game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun Brain Games',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        '/game_info': (context) => GameInfoScreen(gameName: ModalRoute.of(context)!.settings.arguments as String),
        '/cross_sums': (context) => CrossSumsScreen(difficulty: ModalRoute.of(context)!.settings.arguments as String),
        '/word_cookies': (context) => WordCookiesScreen(difficulty: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
