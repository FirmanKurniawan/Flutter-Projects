import 'package:flutter/material.dart';
import 'package:hactoberfest2022/screen/helloworld.dart';
import 'package:hactoberfest2022/screen/travelui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HacktoberFest',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> hacktoberFest = [
    "Helo World",
    "Travel UI",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/desert.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10.0),
          ),
          SliverFixedExtentList(
            itemExtent: 60,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ItemProject(hacktoberFest[index], index),
              childCount: hacktoberFest.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProject extends StatelessWidget {
  int? index;
  String? title;

  ItemProject(String title, int index) {
    this.title = title;
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelloWorld(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TravelUI(),
              ),
            );
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3.0,
          color: Colors.orangeAccent,
          child: Center(
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
