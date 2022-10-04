import 'dart:ui';

import 'package:flutter/material.dart';

class TravelUI extends StatelessWidget {
  const TravelUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
            top: 24.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/dramatic-golden-light-on-the-dark-moody-mountain-landscape-of-etive-picture-id1394826725?k=20&m=1394826725&s=612x612&w=0&h=UVor0WU7VJvRB0oe_g59oqp4vR9vdNwi0l9tsrPngXU='),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 64.0,
            left: 24.0,
            right: 24.0,
            height: 54.0,
            child: SizedBox(
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 0.2),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Azores, Portugal",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24.0,
            left: 0.0,
            right: 0.0,
            child: SizedBox(
              height: 210.0,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: MediaQuery.of(context).size.width - 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            height: 64.0,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                topRight: Radius.circular(24.0),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          bottom: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Jakarta",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.map,
                                    size: 18.0,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "20 Destinasi",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 72.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue[100],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue[100],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
