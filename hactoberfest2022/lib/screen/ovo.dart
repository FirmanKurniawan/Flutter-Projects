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
      padding: EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Icon(
              icon,
              color: Colors.grey[100],
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }

  Widget topMenu({
    required Size deviceSize,
  }) {
    return Row(
      children: <Widget>[
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.remove_circle_outline,
          text: "Home",
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.work,
          text: "Deals",
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.monetization_on,
          text: "Finance",
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.account_balance_wallet,
          text: "Wallet",
        ),
        menuIcon(
          deviceSize: deviceSize,
          icon: Icons.signal_cellular_4_bar,
          text: "History",
        ),
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
            child: const Icon(Icons.settings),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: Theme(
            data: Theme.of(context),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  // topMenu(
                  //   deviceSize: deviceSize,
                  // ),
                  Container(
                    height: 1.0,
                    color: Colors.grey[500],
                  ),
                  // balanceInfo()
                  Stack(
                    children: [
                      Container(
                        height: 95.0,
                        color: const Color(0xFF4d2a86),
                      ),
                      Positioned(
                        child: Container(
                          height: 45.0,
                          width: MediaQuery.of(context).size.width / 5,
                          color: Color(0xfffafafa),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
