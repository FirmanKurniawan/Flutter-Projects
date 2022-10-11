import 'package:flutter/material.dart';
import 'package:quotes_app/Screens/quotes_page.dart';
import 'package:quotes_app/Utils/utils.dart';
import 'package:http/http.dart' as http;
//*for web scrapping
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'love',
    'inspirational',
    'life',
    'humor',
    'reading',
    'friendship'
  ];
  List quotes = [];
  List authors = [];
  bool isData = false;
  @override
  void initState() {
    super.initState();
    getquotes();
  }

  getquotes() async {
    String url = "https://quotes.toscrape.com/";
    http.Response response = await http.get(Uri.parse(url));

    //* This library has a parser for HTML5 documents, that lets you parse HTML easily from a script or server side application:
    dom.Document document = parser.parse(response.body);
    final quotesClass = document.getElementsByClassName("quote");
    // for (int i = 0; i < quotesClass.length; i++) {
    //   quotes.add(quotesClass[i].getElementsByClassName('text')[0].innerHtml);
    // }
    quotes = quotesClass
        .map((element) => element.getElementsByClassName('text')[0].innerHtml)
        .toList();
    authors = quotesClass
        .map((e) => e.getElementsByClassName('author')[0].innerHtml)
        .toList();
    setState(() {
      isData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                )),
                Text(
                  'QUOTES CATEGORY',
                  style: textStyle(23, Colors.purple[900], FontWeight.bold),
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 25,
                crossAxisSpacing: 15,
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuotesPage(categoryName: category)));
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: Text(
                          category.toUpperCase(),
                          style: textStyle(
                              20, Colors.purple[900], FontWeight.w700),
                        )),
                  );
                }).toList()),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                )),
                Text(
                  'GENERAL QUOTES',
                  style: textStyle(23, Colors.purple[900], FontWeight.bold),
                ),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 10,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            isData == false
                ? Center(
                    child: CircularProgressIndicator(color: Colors.purple[900]),
                  )
                : Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: quotes.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(13),
                              margin: const EdgeInsets.all(13),
                              child: Card(
                                color: Colors.white70,
                                elevation: 10,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      quotes[index],
                                      style: textStyle(18, Colors.purple[700],
                                          FontWeight.w500, 1.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "~ ${authors[index]}",
                                      style: textStyle(15, Colors.purple[900],
                                          FontWeight.bold, 1.0),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Positioned(
                                left: 5,
                                child: Image.asset(
                                  'assets/pin.png',
                                  height: 30,
                                  width: 30,
                                )),
                          ]);
                        })
                  ]),
          ]),
        ),
      ),
    );
  }
}
