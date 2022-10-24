import 'package:flutter/material.dart';
import 'package:tile_game/tileGame.dart';

class Popup extends StatefulWidget {
  const Popup({Key? key}) : super(key: key);

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
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
                  'Uh Oh :(    Try Again',
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
