import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Questions.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var counter = 0;
  var score = 0;
  List qList = [ Questons("1. The Human Boday Has Four Lungs", false),
    Questons("2. Kelvin is a measure of temperature", true),
    Questons("3. The Atlantic Ocean is the biggest ocean on Earth", false),
    Questons("4. Sharks are mammals", false),
    Questons("5. The human skeleton is made up of less than 100 bones", false),
    Questons("6. Atomic bombs work by atomic fission", true),
    Questons("7. Molecules are chemically bonded", true),
    Questons("8. Spider have six legs", false),
    Questons("9. Mount Kilimanjo is tallest mountain in the world", false),
    Questons("10. The study of plants is known as bottany", true),
  ];

  checkWin(bool userChoice, BuildContext ctx) {
    if (userChoice == qList[counter].isCorrect) {
      print("Correct");
      score = score + 5;
      final snackbar = SnackBar(content: Text("Correct!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,);
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
    else
    {
      score = score + 0;
      final snackbar = SnackBar(content: Text("In Correct!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,);

      Scaffold.of(ctx).showSnackBar(snackbar);

      print("false");
    }
    setState(() {
      if (counter < 9) {
        counter += 1;
      }
    });
  }

  reset() {
    setState(() {

      counter = 0;
      score = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      //backgroundColor: Colors.lightBlueAccent,
      body: Builder(
        builder: (ctx) =>
            Container(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    width: width,
                    child: Image(image: AssetImage("assets/quizscreen.jpg"),
                      fit: BoxFit.fill,),
                  ),
                  //Padding(padding: EdgeInsets.only(top: height * 0.3)),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    child: Padding(
                      padding:EdgeInsets.only(left: 30,right: 30,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Score $score/50", style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),),
                          InkWell(
                            onTap: reset,
                            child: Text("Reset Game",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,

                              ),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(qList[counter].qText),

                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(onPressed: () => checkWin(true, ctx),
                        padding: EdgeInsets.fromLTRB(50.0, 30, 50, 30),
                        child: Text("TRUE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,


                          ),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),),
                      RaisedButton(onPressed: () => checkWin(false, ctx),
                        padding: EdgeInsets.fromLTRB(50.0, 30, 50, 30),
                        child: Text("FALSE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,


                          ),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),),
                    ],
                  ),


                ],
              ),
            ),
      ),
    );
  }

}