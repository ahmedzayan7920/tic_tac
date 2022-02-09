import 'dart:math';

import 'package:flutter/material.dart';

class Player {
  static String x = "X";
  static String o = "O";

  static List<int> playerX = [];
  static List<int> playerO = [];
}

class Game {
  void playGame(int index, String activePlayer) {
    activePlayer == Player.x
        ? Player.playerX.add(index)
        : Player.playerO.add(index);
  }

  Future<void> autoPlay(String activePlayer) async {
    List<int> emptyCells = [];
    int computerIndex = 0;

    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }

    if (Player.playerO.containsAll(0, 1) && emptyCells.contains(2)) {
      computerIndex = 2;
    } else if (Player.playerO.containsAll(3, 4) && emptyCells.contains(5)) {
      computerIndex = 5;
    } else if (Player.playerO.containsAll(6, 7) && emptyCells.contains(8)) {
      computerIndex = 8;
    } else if (Player.playerO.containsAll(0, 3) && emptyCells.contains(6)) {
      computerIndex = 6;
    } else if (Player.playerO.containsAll(1, 4) && emptyCells.contains(7)) {
      computerIndex = 7;
    } else if (Player.playerO.containsAll(2, 5) && emptyCells.contains(8)) {
      computerIndex = 8;
    } else if (Player.playerO.containsAll(0, 4) && emptyCells.contains(8)) {
      computerIndex = 8;
    } else if (Player.playerO.containsAll(2, 4) && emptyCells.contains(6)) {
      computerIndex = 6;
    }

    //------------------------------------------------------------------------------

    else if (Player.playerO.containsAll(0, 2) && emptyCells.contains(1)) {
      computerIndex = 1;
    } else if (Player.playerO.containsAll(3, 5) && emptyCells.contains(4)) {
      computerIndex = 4;
    } else if (Player.playerO.containsAll(6, 8) && emptyCells.contains(7)) {
      computerIndex = 7;
    } else if (Player.playerO.containsAll(0, 6) && emptyCells.contains(3)) {
      computerIndex = 3;
    } else if (Player.playerO.containsAll(1, 7) && emptyCells.contains(4)) {
      computerIndex = 4;
    } else if (Player.playerO.containsAll(2, 8) && emptyCells.contains(5)) {
      computerIndex = 5;
    } else if (Player.playerO.containsAll(0, 8) && emptyCells.contains(4)) {
      computerIndex = 4;
    } else if (Player.playerO.containsAll(2, 6) && emptyCells.contains(4)) {
      computerIndex = 4;
    }

    //------------------------------------------------------------------------

    else if (Player.playerO.containsAll(2, 1) && emptyCells.contains(0)) {
      computerIndex = 0;
    } else if (Player.playerO.containsAll(5, 4) && emptyCells.contains(3)) {
      computerIndex = 3;
    } else if (Player.playerO.containsAll(8, 7) && emptyCells.contains(6)) {
      computerIndex = 6;
    } else if (Player.playerO.containsAll(6, 3) && emptyCells.contains(0)) {
      computerIndex = 0;
    } else if (Player.playerO.containsAll(7, 4) && emptyCells.contains(1)) {
      computerIndex = 1;
    } else if (Player.playerO.containsAll(8, 5) && emptyCells.contains(2)) {
      computerIndex = 2;
    } else if (Player.playerO.containsAll(8, 4) && emptyCells.contains(0)) {
      computerIndex = 0;
    } else if (Player.playerO.containsAll(6, 4) && emptyCells.contains(2)) {
      computerIndex = 2;
    }

//------------------------------------------------------------------------------------

    else {
      if (Player.playerX.containsAll(0, 1) && emptyCells.contains(2)) {
        computerIndex = 2;
      } else if (Player.playerX.containsAll(3, 4) && emptyCells.contains(5)) {
        computerIndex = 5;
      } else if (Player.playerX.containsAll(6, 7) && emptyCells.contains(8)) {
        computerIndex = 8;
      } else if (Player.playerX.containsAll(0, 3) && emptyCells.contains(6)) {
        computerIndex = 6;
      } else if (Player.playerX.containsAll(1, 4) && emptyCells.contains(7)) {
        computerIndex = 7;
      } else if (Player.playerX.containsAll(2, 5) && emptyCells.contains(8)) {
        computerIndex = 8;
      } else if (Player.playerX.containsAll(0, 4) && emptyCells.contains(8)) {
        computerIndex = 8;
      } else if (Player.playerX.containsAll(2, 4) && emptyCells.contains(6)) {
        computerIndex = 6;
      }

      //------------------------------------------------------------------------------

      else if (Player.playerX.containsAll(0, 2) && emptyCells.contains(1)) {
        computerIndex = 1;
      } else if (Player.playerX.containsAll(3, 5) && emptyCells.contains(4)) {
        computerIndex = 4;
      } else if (Player.playerX.containsAll(6, 8) && emptyCells.contains(7)) {
        computerIndex = 7;
      } else if (Player.playerX.containsAll(0, 6) && emptyCells.contains(3)) {
        computerIndex = 3;
      } else if (Player.playerX.containsAll(1, 7) && emptyCells.contains(4)) {
        computerIndex = 4;
      } else if (Player.playerX.containsAll(2, 8) && emptyCells.contains(5)) {
        computerIndex = 5;
      } else if (Player.playerX.containsAll(0, 8) && emptyCells.contains(4)) {
        computerIndex = 4;
      } else if (Player.playerX.containsAll(2, 6) && emptyCells.contains(4)) {
        computerIndex = 4;
      }

      //------------------------------------------------------------------------

      else if (Player.playerX.containsAll(2, 1) && emptyCells.contains(0)) {
        computerIndex = 0;
      } else if (Player.playerX.containsAll(5, 4) && emptyCells.contains(3)) {
        computerIndex = 3;
      } else if (Player.playerX.containsAll(8, 7) && emptyCells.contains(6)) {
        computerIndex = 6;
      } else if (Player.playerX.containsAll(6, 3) && emptyCells.contains(0)) {
        computerIndex = 0;
      } else if (Player.playerX.containsAll(7, 4) && emptyCells.contains(1)) {
        computerIndex = 1;
      } else if (Player.playerX.containsAll(8, 5) && emptyCells.contains(2)) {
        computerIndex = 2;
      } else if (Player.playerX.containsAll(8, 4) && emptyCells.contains(0)) {
        computerIndex = 0;
      } else if (Player.playerX.containsAll(6, 4) && emptyCells.contains(2)) {
        computerIndex = 2;
      } else {
        if (emptyCells.isNotEmpty) {
          Random random = Random();
          int randomIndex = random.nextInt(emptyCells.length);
          computerIndex = emptyCells[randomIndex];
        }
      }
    }
    if (emptyCells.isNotEmpty) {
      playGame(computerIndex, activePlayer);
    }
  }

  String winnerCheck() {
    String winner = "";
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = "Player X Wins";
    } else if (Player.playerO.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = "Player O Wins";
    }
    return winner;
  }
}

extension _ on List {
  bool containsAll(int x, int y, [z]) {
    if (z != null) {
      return contains(x) && contains(y) && contains(z);
    } else {
      return contains(x) && contains(y);
    }
  }
}
