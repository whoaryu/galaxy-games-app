// cross_sums_screen.dart

import 'package:flutter/material.dart';
import 'game_levels.dart';

class CrossSumsScreen extends StatefulWidget {
  final String difficulty;

  CrossSumsScreen({required this.difficulty});

  @override
  _CrossSumsScreenState createState() => _CrossSumsScreenState();
}

class _CrossSumsScreenState extends State<CrossSumsScreen> {
  late List<List<int>> grid;
  late List<int> rowSums;
  late List<int> colSums;
  late List<List<bool>> marked;
  int hearts = 3;
  bool isPencil = true;
  int currentLevel = 0;

  @override
  void initState() {
    super.initState();
    loadLevel();
  }

  void loadLevel() {
    final levels = GameLevels.getCrossSumsLevels(widget.difficulty);
    final level = levels[currentLevel];
    grid = List<List<int>>.from(level['grid']);
    rowSums = List<int>.from(level['rowSums']);
    colSums = List<int>.from(level['colSums']);
    marked = List.generate(grid.length, (_) => List.filled(grid[0].length, false));
  }

  void toggleCell(int row, int col) {
    if (hearts <= 0) return;

    setState(() {
      if (isPencil) {
        marked[row][col] = !marked[row][col];
      } else {
        grid[row][col] = 0; // "Erase" the number.
      }
    });

    if (!validateSolution()) {
      setState(() {
        hearts--;
      });
    }
  }

  bool validateSolution() {
    for (int i = 0; i < grid.length; i++) {
      int rowSum = 0;
      for (int j = 0; j < grid[i].length; j++) {
        if (marked[i][j]) rowSum += grid[i][j];
      }
      if (rowSum != rowSums[i]) return false;
    }

    for (int j = 0; j < grid[0].length; j++) {
      int colSum = 0;
      for (int i = 0; i < grid.length; i++) {
        if (marked[i][j]) colSum += grid[i][j];
      }
      if (colSum != colSums[j]) return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.difficulty.capitalize()} - Level ${currentLevel + 1}"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    3,
                    (index) => Icon(
                      index < hearts ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  isPencil ? "Pencil Mode" : "Eraser Mode",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: isPencil,
                  onChanged: (value) {
                    setState(() {
                      isPencil = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: grid.length,
                childAspectRatio: 1,
              ),
              itemCount: grid.length * grid[0].length,
              itemBuilder: (context, index) {
                int row = index ~/ grid.length;
                int col = index % grid.length;

                return GestureDetector(
                  onTap: () => toggleCell(row, col),
                  child: Card(
                    color: marked[row][col] ? Colors.green : Colors.white,
                    child: Center(
                      child: Text(
                        grid[row][col] != 0 ? grid[row][col].toString() : '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: hearts > 0 && validateSolution()
                ? () {
                    if (currentLevel < GameLevels.getCrossSumsLevels(widget.difficulty).length - 1) {
                      setState(() {
                        currentLevel++;
                        loadLevel();
                      });
                    } else {
                      Navigator.pop(context); // Back to main screen.
                    }
                  }
                : null,
            child: Text(hearts > 0 ? "Next Level" : "Restart"),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
