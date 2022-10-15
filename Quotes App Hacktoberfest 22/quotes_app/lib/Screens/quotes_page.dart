import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import 'package:http/http.dart' as http;
//*for web scrapping
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class QuotesPage extends StatefulWidget {
  final String categoryName;
  const QuotesPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  List quotes = [];
  List authors = [];
  bool isData = false;
  @override
  void initState() {
    super.initState();
    getquotes();
  }

  getquotes() async {
    String url = "https://quotes.toscrape.com/tag/${widget.categoryName}/";
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
      child: isData == false
          ? const Center(
              child: CircularProgressIndicator(color: Colors.purple),
            )
          : SingleChildScrollView(
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
                      "${widget.categoryName} Quotes".toUpperCase(),
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
                  height: 30,
                ),
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
            ),
    ));
  }
}
