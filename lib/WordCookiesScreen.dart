import 'package:flutter/material.dart';
import 'package:galaxy_games/game_levels.dart'; // Ensure this path is correct.

class WordCookiesScreen extends StatefulWidget {
  final String difficulty;

  WordCookiesScreen({required this.difficulty});

  @override
  _WordCookiesScreenState createState() => _WordCookiesScreenState();
}

class _WordCookiesScreenState extends State<WordCookiesScreen> {
  late List<List<String>> grid;
  late List<String> validWords;
  String currentWord = '';
  Set<String> foundWords = {};
  int score = 0;

  @override
  void initState() {
    super.initState();
    setupLevel();
  }

  void setupLevel() {
    // Fetch grid and words based on difficulty
    var levels = GameLevels.getWordCookiesLevels(widget.difficulty);
    if (levels.isNotEmpty) {
      var level = levels.first; // Load the first level for the selected difficulty.
      grid = List<List<String>>.from(level['grid']);
      validWords = List<String>.from(level['validWords']);
    } else {
      // If no levels found, use a default or empty grid.
      grid = [[]];
      validWords = [];
    }
  }

  void onLetterTap(String letter) {
    setState(() {
      currentWord += letter;
    });
  }

  void onWordComplete() {
    if (validWords.contains(currentWord) && !foundWords.contains(currentWord)) {
      setState(() {
        score += currentWord.length * 10;
        foundWords.add(currentWord);
        currentWord = '';
      });
    } else {
      setState(() {
        currentWord = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text("Word Cookies - ${widget.difficulty}"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Score: $score", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: grid.length),
              itemCount: grid.length * grid[0].length,
              itemBuilder: (context, index) {
                int row = index ~/ grid.length;
                int col = index % grid.length;

                return GestureDetector(
                  onTap: () => onLetterTap(grid[row][col]),
                  onDoubleTap: onWordComplete,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(grid[row][col], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Current Word: $currentWord", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
