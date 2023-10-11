import 'dart:math';

import 'package:calculator/components/button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var userInput = '';
var answer = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 390,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0,right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Text(
                        userInput.toString(),
                        style: const TextStyle(color: purple,fontSize: 24),
                      ),
                      Text(
                        answer.toString(),
                        style: const TextStyle(color: Colors.white,fontSize: 42, fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    my_Button(
                      Title: '%',
                      onPress: () {
                        userInput += '%';
                        setState(() {

                        });
                      },
                    ),
                    my_Button(Title: 'DEL', onPress: () {
                      userInput = userInput.substring(0,userInput.length-1);
                      setState(() {

                      });
                    }),
                    my_Button(Title: 'AC', onPress: () {
                      userInput = '';
                      answer= '';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '÷', onPress: () {
                      userInput += '÷';
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    my_Button(
                      Title: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {

                        });
                      },
                    ),
                    my_Button(Title: '8', onPress: () {
                      userInput += '8';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '9', onPress: () {
                      userInput += '9';
                      setState(() {

                      });
                    }),
                    my_Button(Title: 'x', onPress: () {
                      userInput += 'x';
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    my_Button(
                      Title: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {

                        });
                      },
                    ),
                    my_Button(Title: '5', onPress: () {
                      userInput += '5';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '6', onPress: () {
                      userInput += '6';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '-', onPress: () {
                      userInput += '-';
                      setState(() {

                      });
                    }),
                  ],
                ),
                Row(
                  children: [
                    my_Button(
                      Title: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {

                        });
                      },
                    ),
                    my_Button(Title: '2', onPress: () {
                      userInput += '2';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '3', onPress: () {
                      userInput += '3';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '+', onPress: () {
                      userInput += '+';
                    setState(() {

                    });}),
                  ],
                ),
                Row(
                  children: [
                    my_Button(
                      Title: '',
                      onPress: () {
                        userInput += '';
                        setState(() {

                        });
                      },
                    ),
                    my_Button(Title: '0', onPress: () {
                      userInput += '0';
                      setState(() {

                      });
                    }),
                    my_Button(Title: '.', onPress: () {
                      userInput += '.';
                      setState(() {

                      });
                    }),
                    my_Button(
                        Title: '=', color: purple, onPress: () {
                          equalPress();
                          setState(() {

                          });
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void equalPress (){
    String FinalUserInput = userInput;
    FinalUserInput = userInput.replaceAll('x', '*').replaceAll('÷', '/');

    Parser p = Parser();
    Expression expression = p.parse(FinalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();

  }
}

