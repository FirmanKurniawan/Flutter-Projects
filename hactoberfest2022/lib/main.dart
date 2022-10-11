import 'package:flutter/material.dart';
import 'screen/screen.dart';
//import 'package:hactoberfest2022/screen/helloworld.dart';
import 'package:hactoberfest2022/screen/ovo.dart';
//import 'package:hactoberfest2022/screen/travelui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HacktoberFest',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
          const SliverPadding(
            padding: EdgeInsets.only(top: 10.0),
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
  final int? index;
  final String? title;

  const ItemProject(String this.title, int this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HelloWorld(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TravelUI(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OvoUI(),
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
