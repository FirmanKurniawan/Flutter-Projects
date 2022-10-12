import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightBlue,
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    'https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding:
                              const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(
                                    Radius.circular(10)),
                          ),
                          child: const Text(
                            "Initiator",
                            style: TextStyle(
                                color: Colors.white),
                          ),
                        ),
                        const Text(
                        "Sova",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: const Text(
                    'Biography',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 200,
                color: Colors.lightBlue[200],
                child: Text(
                    'Born from the eternal winter of Russia\'s tundra, Sova tracks, finds, and eliminates enemies with ruthless efficiency and precision. His custom bow and incredible scouting abilities ensure that even if you run, you cannot hide.'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 100,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[200],
                    borderRadius:
                        BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Image.network(
                        'https://media.valorant-api.com/agents/ded3520f-4264-bfed-162d-b080e2abccf9/abilities/ability2/displayicon.png',
                        height: 50,
                        width: 50),
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text('Recon Bolt'),
                        Text(
                            'EQUIP a bow with recon bolt.'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}