import 'package:flutter/material.dart';

class GameInfoScreen extends StatelessWidget {
  final String gameName;

  GameInfoScreen({required this.gameName});

  @override
  Widget build(BuildContext context) {
    String description = gameName == 'Cross Sums'
        ? "In Cross Sums, eliminate unnecessary numbers to match the row and column sums. Choose your difficulty!"
        : "In Word Cookies, swipe across letters to form valid words. The longer the word, the higher the score!";
    List<String> difficulties = ['Easy', 'Medium', 'Hard'];

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Hero(
          tag: gameName == 'Cross Sums' ? 'cross_sums_button' : 'word_cookies_button',
          child: Material(
            color: Colors.transparent,
            child: Text(gameName),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            Text("Select Difficulty:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...difficulties.map((level) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      gameName == 'Cross Sums' ? '/cross_sums' : '/word_cookies',
                      arguments: level,
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(level, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
