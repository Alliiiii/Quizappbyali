import 'dart:async';
import 'package:flutter/material.dart';
import 'HomePage.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>MyHomePage(),
          )
    ));
  }
  @override
  Widget build(BuildContext context) {

    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Image.asset(

                'assets/splashscrren1.jpg',
                fit:BoxFit.cover,
            ),   ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(bottom:80),
                  /*    child: Text(
                        "Well Come To Circuit 4-U",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            color: Colors.black),
                      ),*/
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}