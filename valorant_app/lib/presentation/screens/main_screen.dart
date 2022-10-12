import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Wrap(
              spacing: 15,
              children: [
                GestureDetector(
                    onTap: (() {
                      setState(() {
                        _isClicked = !_isClicked;
                      });
                    }),
                    child: AnimatedContainer(
                      height: _isClicked ? screenSize.height : 200.0,
                      width: _isClicked ? screenSize.width : 350.0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      alignment: _isClicked
                          ? Alignment.center
                          : AlignmentDirectional.topStart,
                      duration: const Duration(seconds: 1),
                      color: _isClicked ? Colors.lightBlue : Colors.lightBlue,
                      child: _isClicked
                          ? DetailScreen()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Image.network("https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png",height: 200,
                                  width: 290,
                                )),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Sova",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32.0)),
                                      Text("Click to see more",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      // Text("Raze", style: TextStyle(color: Colors.white))
                    )),
              ],
            ),
          )),
    );
  }
}
