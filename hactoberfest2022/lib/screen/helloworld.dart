import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('Hello World Page'),
      ),
      body: const Center(
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
