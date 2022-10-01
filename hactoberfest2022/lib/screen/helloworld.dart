import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Hello World Page'),
      ),
      body: Center(
        child: Text(
          'Hello World Flutter',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
