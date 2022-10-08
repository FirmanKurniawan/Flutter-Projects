import 'package:flutter/material.dart';

class OvoUI extends StatefulWidget {
  const OvoUI({super.key});

  @override
  State<OvoUI> createState() => _OvoUIState();
}

class _OvoUIState extends State<OvoUI> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pageController,
        children: [
          Text('Hello Ovo'),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
    );
  }
}
