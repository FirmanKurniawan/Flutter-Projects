import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OvoUI extends StatelessWidget {
  const OvoUI({super.key});

  Widget menuIcon({
    required Size deviceSize,
    required String text,
    required IconData icon,
  }) {
    return Container(
      height: 60.0,
      width: deviceSize.width / 5,
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Icon(
              icon,
              color: Colors.grey[100],
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey[100]),
          ),
        ],
      ),
    );
  }

  Widget topMenu({
    required Size deviceSize,
  }) {
    return Row(
      children: [
        menuIcon(
          deviceSize: deviceSize,
          text: "Home",
          icon: Icons.remove_circle_outline,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4d2a86),
        elevation: 0.0,
        title: Image.asset('images/ovo_logo.png'),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.bell),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: Theme(
            data: Theme.of(context),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [topMenu(deviceSize: deviceSize)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
