// game_levels.dart

class GameLevels {
  // CrossSums Levels
  static const List<Map<String, dynamic>> crossSumsLevels = [
    // Easy Levels
    {
      'difficulty': 'Easy',
      'grid': [
        [5, 3, 0, 2],
        [1, 4, 3, 0],
        [0, 2, 5, 3],
        [4, 0, 1, 2],
      ],
      'rowSums': [10, 8, 10, 7],
      'colSums': [6, 7, 9, 13],
    },
    // Add more Easy levels...
    // Medium Levels
    {
      'difficulty': 'Medium',
      'grid': [
        [4, 2, 3, 5, 0],
        [0, 3, 4, 2, 1],
        [5, 0, 1, 3, 2],
        [2, 5, 0, 4, 3],
        [1, 2, 5, 0, 4],
      ],
      'rowSums': [14, 10, 11, 14, 12],
      'colSums': [10, 12, 13, 14, 13],
    },
    // Add more Medium levels...
    // Hard Levels
    {
      'difficulty': 'Hard',
      'grid': [
        [3, 1, 5, 0, 4, 2],
        [4, 3, 0, 5, 2, 1],
        [0, 2, 4, 3, 5, 1],
        [1, 0, 3, 4, 2, 5],
        [2, 5, 1, 0, 3, 4],
        [5, 4, 2, 1, 0, 3],
      ],
      'rowSums': [15, 14, 12, 13, 14, 16],
      'colSums': [10, 14, 15, 11, 16, 13],
    },
    // Add more Hard levels...
  ];

  static const List<Map<String, dynamic>> wordCookiesLevels = [
    // Easy Levels
    {
      'difficulty': 'Easy',
      'grid': [
        ['C', 'A', 'T'],
        ['R', 'O', 'P'],
        ['E', 'N', 'T'],
      ],
      'validWords': ['CAT', 'TEN', 'NET', 'ROPE', 'POT'],
    },
    // Add more Easy levels...
    // Medium Levels
    {
      'difficulty': 'Medium',
      'grid': [
        ['B', 'A', 'K', 'E'],
        ['R', 'A', 'C', 'E'],
        ['S', 'I', 'T', 'E'],
        ['T', 'O', 'P', 'S'],
      ],
      'validWords': ['BAKE', 'RACE', 'SITE', 'TOPS', 'BASE'],
    },
    // Add more Medium levels...
    // Hard Levels
    {
      'difficulty': 'Hard',
      'grid': [
        ['M', 'A', 'T', 'H'],
        ['E', 'S', 'C', 'A'],
        ['P', 'E', 'D', 'A'],
        ['T', 'I', 'O', 'N'],
      ],
      'validWords': ['MATH', 'ESCAPE', 'DATA', 'NOTE', 'PACE'],
    },
    // Add more Hard levels...
  ];

  // Get levels filtered by difficulty for CrossSums
  static List<Map<String, dynamic>> getCrossSumsLevels(String difficulty) {
    return crossSumsLevels.where((level) => level['difficulty'] == difficulty).toList();
  }

  // Get levels filtered by difficulty for WordCookies
  static List<Map<String, dynamic>> getWordCookiesLevels(String difficulty) {
    return wordCookiesLevels.where((level) => level['difficulty'] == difficulty).toList();
  }
}
