import 'package:flutter/material.dart';
import 'package:tile_game/tileGame.dart';

class PopupWon extends StatefulWidget {
  const PopupWon({Key? key}) : super(key: key);

  @override
  State<PopupWon> createState() => _PopupWonState();
}

class _PopupWonState extends State<PopupWon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            height: 500,
            color: Colors.grey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Yayy  :)  You found 7',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  onPressed: () {
                    setState(() {
                      startOver();
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Play Again',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}
