import 'package:flutter/material.dart';
import 'package:tile_game/resultwon.dart';
import 'package:tile_game/tileGame.dart';
import 'package:tile_game/result.dart';
import 'package:flutter/services.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tileGame(),
    theme: ThemeData(fontFamily: 'Ubuntu'),
    routes: {
      '/gameOver': (context) => popup(),
      '/won': (context) => popupWon(),
    },
  ));
}