import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac/game_logic.dart';

import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activePlayer = Player.x;
  bool gameOver = false;
  int turn = 0;
  String result = "";
  Game game = Game();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                children: [
                  ...buildFirstBlock(),
                  buildSecondBlock(context),
                  ...buildThirdBlock(),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...buildFirstBlock(),
                        const SizedBox(height: 24),
                        ...buildThirdBlock(),
                      ],
                    ),
                  ),
                  buildSecondBlock(context),
                ],
              ),
      ),
    );
  }

  List<Widget> buildFirstBlock() {
    return [
      SwitchListTile.adaptive(
          value: isSwitched,
          title: const Text(
            "Turn on/off two player",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          onChanged: (newValue) {
            setState(
              () {
                isSwitched = newValue;
              },
            );
          }),
      Text(
        "it's $activePlayer turn",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 52,
        ),
      ),
    ];
  }

  Expanded buildSecondBlock(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(16),
        children: List.generate(
          9,
          (index) => InkWell(
            onTap: gameOver ? null : () => _onTap(index),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? Player.x
                      : Player.playerO.contains(index)
                          ? Player.o
                          : "",
                  style: TextStyle(
                    fontSize: 60,
                    color: Player.playerX.contains(index)
                        ? Colors.blue
                        : Colors.pink,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildThirdBlock() {
    return [
      Text(
        result.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 42,
        ),
      ),
      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            activePlayer = Player.x;
            gameOver = false;
            turn = 0;
            result = "";
            Player.playerX.clear();
            Player.playerO.clear();
          });
        },
        icon: const Icon(Icons.replay),
        label: const Text("Repeat The Game"),
      ),
    ];
  }

  _onTap(int index) async {
    if (!Player.playerX.contains(index) && !Player.playerO.contains(index)) {
      game.playGame(index, activePlayer);
      updateState();

      if (!isSwitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = activePlayer == Player.x ? Player.o : Player.x;
      turn++;
      result = game.winnerCheck();
      if (result == "Player X Wins" || result == "Player O Wins") {
        gameOver = true;
        playSound(result);
      } else if (result == "" && turn == 9) {
        result = "It's Draw";
      }
    });
  }

  playSound(result) async {
    AudioPlayer player = AudioPlayer();
    String audio = "sound/win_sound.mp3";
    if (!isSwitched) {
      if (result == "Player X Wins") {
        audio = "sound/win_sound.mp3";
      } else {
        audio = "sound/lose_sound.mp3";
      }
    }
    ByteData bytes = await rootBundle.load(audio);
    Uint8List soundBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await player.playBytes(soundBytes);
  }
}
