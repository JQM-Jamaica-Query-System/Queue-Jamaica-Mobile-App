import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(new MaterialApp(
    home: new LandingPage(),
  ));
}


class LandingPage extends StatefulWidget{
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{
  Widget build(BuildContext context){
    return new MaterialApp(
      color: Colors.white,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Center(
            child: Image(
          image: AssetImage('assets/images/logo.jpg')
      )
    )
    )
      )
      )
      );
  }
}