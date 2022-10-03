import 'package:flutter/material.dart';

Color textColor = Colors.white;
Color chanceTextColor = Colors.grey.shade400;
Color bgColor = Colors.black87;
Color bgColor2 = Colors.grey.shade900;
Color bgColor3 = Colors.grey.shade800;
Color tileColor = Colors.black87;
Color tileBorderColor = Colors.grey.shade100;

var count = 4;

bool textVisibility1 = false;
bool textVisibility2 = false;
bool textVisibility3 = false;
bool textVisibility4 = false;
bool textVisibility5 = false;
bool textVisibility6 = false;
bool textVisibility7 = false;
bool textVisibility8 = false;
bool textVisibility9 = false;

var randomNums = [1,2,3,4,5,6,7,8,9];

startOver(){
  count = 4;
  textVisibility1 = false;
  textVisibility2 = false;
  textVisibility3 = false;
  textVisibility4 = false;
  textVisibility5 = false;
  textVisibility6 = false;
  textVisibility7 = false;
  textVisibility8 = false;
  textVisibility9 = false;
  randomNums.shuffle();
  print('Execute ho raha h');
}

var facts = [
  'There are 7 continents in the World',
  'There are 7 colors of the rainbow',
  'There are 7 basic musical notes',
  'A ladybug commonly has 7 spots',
  'The neutral pH value is 7',
  'There are 7 logic gates',
  'There are 7 wonders of the world'
];


bool popupVisibility = false;


class tileGame extends StatefulWidget {
  const tileGame({ Key? key }) : super(key: key);

  @override
  State<tileGame> createState() => _tileGameState();
}

class _tileGameState extends State<tileGame> {

  @override
  Widget build(BuildContext context) {
    randomNums.shuffle();
    facts.shuffle();
    if(count==1){
      setState(() {
        popupVisibility = true;
      });
    }
    return SafeArea(
      child: Scaffold(




        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: appBar(),
            ),
            Expanded(
              flex: 15,
              child: board(),
            ),
            Expanded(
              flex: 4,
              child: funFact(),
            ),
            // ),
          ]
        ),
          




      ),
    );
  }
}


class appBar extends StatefulWidget {
  const appBar({ Key? key }) : super(key: key);

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Touch the tiles to find 7',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: textColor
            ),
          ),
        ],
      ),
    );
  }
}




class board extends StatefulWidget {
  const board({ Key? key }) : super(key: key);

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility1=true;
                  });
                  count = count - 1;
                  if(randomNums[0]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                  }
                  
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility1,
                      child: Text(
                          '${randomNums[0]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),


              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility2=true;
                  });
                  count = count - 1;
                  if(randomNums[1]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility2,
                      child: Text(
                          '${randomNums[1]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),


              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility3 = true;
                  });
                  count = count - 1;
                  if(randomNums[2]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility3,
                      child: Text(
                          '${randomNums[2]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility4 = true;
                  });
                  count = count - 1;
                  if(randomNums[3]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility4,
                      child: Text(
                          '${randomNums[3]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility5 = true;
                  });
                  count = count - 1;
                  if(randomNums[4]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility5,
                      child: Text(
                          '${randomNums[4]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility6 = true;
                  });
                  count = count - 1;
                  if(randomNums[5]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility6,
                      child: Text(
                          '${randomNums[5]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility7 = true;
                  });
                  count = count - 1;
                  if(randomNums[6]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility7,
                      child: Text(
                          '${randomNums[6]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility8 = true;
                  });
                  count = count - 1;
                 if(randomNums[7]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility8,
                      child: Text(
                          '${randomNums[7]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    textVisibility9 = true;
                  });
                  count = count - 1;
                  if(randomNums[8]==7){
                    Navigator.pushNamed(context, '/won');
                  }else{
                    setState(() {
                      if(count == 1){
                        Navigator.pushNamed(context, '/gameOver');
                      }
                    });
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: tileColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: tileBorderColor , width: 4)
                    ),
                    child: Visibility(
                      visible: textVisibility9,
                      
                      child: Text(
                          '${randomNums[8]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: textColor
                          ),
                        ),
                    ),
                  ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
              '${count-1} chances left',
                style: TextStyle(
                  color: chanceTextColor,
                  fontSize: 23
                ),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    startOver();
                  });
                },
                backgroundColor: bgColor3,
                child: Text(
                  'Start Over',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                  ),
              )
            ]
          )
        ],
      ),
    );
  }
}



class funFact extends StatefulWidget {
  const funFact({ Key? key }) : super(key: key);

  @override
  State<funFact> createState() => _funFactState();
}

class _funFactState extends State<funFact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Fun Fact about 7   :)',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: 'Ubuntuu'
            ),
          ),
          Text(
            '${facts[0]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontFamily: 'Ubuntuu',
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
