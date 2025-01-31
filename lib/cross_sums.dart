import 'package:flutter/material.dart';

class RuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("Cross Sums Rules"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rules:",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "- Select numbers to match the sums for each row and column.",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "- Eliminate unnecessary numbers using the toggle.",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "- Finalize your answer using the pencil toggle.",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "- You have 3 hearts. Each wrong move loses 1 heart.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Choose Difficulty:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game', arguments: 'easy');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  
                  child: const Text("Easy"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game', arguments: 'medium');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text("Medium"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game', arguments: 'hard');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                   child: const Text("Hard"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
