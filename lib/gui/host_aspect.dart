import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp( home: HostLines()));

class HostLines extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HostLinesState();
  }
}
    
  class HostLinesState extends State<HostLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("MY LINES", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)), backgroundColor: Colors.tealAccent[400],),
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: Text("General Teller Lines" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("15\n\nWaiting\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("2\n\nMissed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("70\n\nServed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.green ,fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
          new Divider(
            indent: 10,
            height: 10,
            thickness: 10,
          ),
          new ListTile(
            title: Text("Cheque Deposit", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("5\n\nWaiting\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("0\n\nMissed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("10\n\nServed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.green ,fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
          new Divider(
            indent: 10,
            height: 10,
            thickness: 10,
          ),
          new ListTile(
            title: Text("Loan Application", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("20\n\nWaiting\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("3\n\nMissed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.red ,fontSize: 20, fontWeight: FontWeight.bold),),
              new Text("95\n\nServed\n", textAlign: TextAlign.center, style: TextStyle(color: Colors.green ,fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
          new Divider(
            indent: 10,
            height: 10,
            thickness: 10,
          ),
          new ButtonBar(
            buttonPadding: EdgeInsets.all(20),
            children: <Widget> [
              FlatButton(onPressed: (null), child: Text("Set up another line", style: TextStyle(color: Colors.white, backgroundColor: Colors.greenAccent[200], fontSize: 30, fontWeight: FontWeight.bold),))
            ],
            buttonHeight: 100,
            buttonMinWidth: 500
          )
        ]
      ),              
      bottomNavigationBar: new Container(
        child: MyAppBar(),
          ),
        );
    }
}     


class MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 10.0,
          )
        ],
      ),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, size: 25,),
            tooltip: 'Home',
            onPressed: null, // null disables the button
          ),
          IconButton(
            icon: Icon(Icons.add_box, size: 25,),
            tooltip: 'Create',
            onPressed: null, // null disables the button
          ),
          IconButton(
            icon: Icon(Icons.rate_review, size: 25,),
            tooltip: 'Details',
            onPressed: null, // null disables the button
          ),
          IconButton(
            icon: Icon(Icons.account_box, size: 25,),
            tooltip: 'Profile',
            onPressed: null, // null disables the button
          ),
        ],
      ),
    );
  }
}
