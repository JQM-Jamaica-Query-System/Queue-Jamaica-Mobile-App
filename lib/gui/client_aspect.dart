import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp( home: MyHomePage()));

//old Version
/*
class MyHomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.tealAccent[400],
      child: new Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Current Line"),
                Text("You have not joined a line as yet"),
              ]
            ),
          ),
          MyAppBar(),
        ],
      ),
    );
  }
}
*/

//Close to finished Home UI Version
class MyHomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : Center(
          child: Text("Current Lines:", style: (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
        ),
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: Center(child: Text("You have not joined a line as yet", style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: MyAppBar(),
      ),
    );
  }
}

//The App Bar for the Widget, would have to change to a Stateful Version for implementation
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

//Prototype for the List Filled Home Version --NOOTT WORKING AS YET----
class MyHomePage2 extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){ 
    final double dwidth = MediaQuery. of(context). size. width;
    return Scaffold(
      appBar: AppBar(
        title : Center(
          child: Text("Current Lines:", style: (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
        ),
        backgroundColor: Colors.tealAccent[400],
      ),
      
      //Body of the App with the list 
      body: Container(
        width: dwidth,
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[QueueCard(),QueueCard()],
        ),
        
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: MyAppBar(),
      ),
    );
  }
}

//Prototype on the Queue Card --NOT FUNCTIONAL AS YET IF YOU ARE RUNNING COMMENT OUT THE LIST HOMEPAGE AND THIS
class QueueCard extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    final double dwidth = MediaQuery. of(context). size. width;
    final double dheight = MediaQuery. of(context). size. height;
    final double b1width = (.9*dwidth);
    final double b1height = (.25*dheight);
    final double b2width = (.65*dwidth);
    final double b3width = (.25*dwidth);
    final double b2height = (.20*b1height);
    final double b3height = (.53*b1height);
    
     return Container(
        width: b1width,
        height: b1height,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: new BorderRadius.all(const Radius.circular(40.0)),
          boxShadow: [BoxShadow(
            color: Colors.grey[700],
            blurRadius: 10.0,
            )
          ]
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //The two Smaller Panels for the List card
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: b2width,
                  height: b2height,
                  padding : const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: new BorderRadius.all(const Radius.circular(10.0)),                        
                  ), 
                  child: Center(child:Text("Someplace in Downtown Kingston", style : TextStyle(fontSize: 16,color: Colors.white),),),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, size: 30),
                  tooltip: 'Profile',
                  onPressed: null, // null disables the button
                ),
              ]
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: <Widget>[
              Container(
                width: b3width,
                height: b3height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: const Color(0xFFD6D6D6)),
                ),
                child : Center(child: Text("8", style: TextStyle(fontSize: 40, color: Colors.blue,))),
              ),
              Container(
                width: b3width,
                height: b3height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: const Color(0xFFD6D6D6)),
                ),
                child : Center(child: Text("845", style: TextStyle(fontSize: 40, color: Colors.black,))),
              ),
            ]
            ), 
          ]
        ),
      );
  }
}

//Creation Page to join A Line form the Client Side
class CreationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double dwidth = MediaQuery.of(context).size.width;
    //double dheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title : Center(
          child: Text("Join a Line:", style: (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)))
        ),
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Container(
        width: dwidth,
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            TextContain(),
            const SizedBox(height: 20),
            Details(),
            const SizedBox(height: 10),
            const RaisedButton(
            onPressed: null,
            color: const Color(0xFF1976D2),
            child: Text('JOIN A LINE', style: TextStyle(color: Colors.white,fontSize: 20.0)),
          ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: MyAppBar(),
      ),
    );
  }
}


class TextContain extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double dwidth = MediaQuery.of(context).size.width;
    double dheight = MediaQuery.of(context).size.height;
    return Container(
      padding:  const EdgeInsets.all(5),
      width: (.75*dwidth),
      height: (.1*dheight),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: new BorderRadius.all(Radius.circular(40.0),)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a line code',
        ),
      ),
    );
  }
}

class Details extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double dwidth = MediaQuery.of(context).size.width;
    double dheight = MediaQuery.of(context).size.height;
    return Container(
      width: .75*dwidth,
      height: .50*dheight,
      decoration : BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: .75*dwidth,
            height: .065*dheight,
            padding: const EdgeInsets.all(5.0),
            decoration : BoxDecoration(
              color: Colors.tealAccent[700],
            ),
            child: Text("Details", style: TextStyle(fontSize: 22, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    double dwidth = MediaQuery.of(context).size.width;
    //double dheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title : Center(
          child: Text("Line Details:", style: (TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),)
        ),
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Container(
        width: dwidth,
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            TextContain(),
            const SizedBox(height: 20),
            DetailCard(),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[400],
        ),
        child: MyAppBar(),
      ),
    );
  }
}

class DetailCard extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    final double dwidth = MediaQuery. of(context). size. width;
    final double dheight = MediaQuery. of(context). size. height;
    final double b1width = (.9*dwidth);
    final double b1height = (.61*dheight);
    final double b2width = (.65*dwidth);
    final double b3width = (.20*dwidth);
    final double b2height = (.075*b1height);
    final double b3height = (.20*b1height);
    final double b4height = (.45*b1height);
    
     return Container(
        width: b1width,
        height: b1height,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: new BorderRadius.all(const Radius.circular(40.0)),
          boxShadow: [BoxShadow(
            color: Colors.grey[700],
            blurRadius: 10.0,
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //The two Smaller Panels for the List card
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: b2width,
                  height: b2height,
                  padding : const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[700],
                    borderRadius: new BorderRadius.all(const Radius.circular(10.0)),                        
                  ), 
                  child: Center(child:Text("Someplace in Downtown Kingston", style : TextStyle(fontSize: 16,color: Colors.white),),),
                ),
              ]
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: <Widget>[
              Container(
                width: b3width,
                height: b3height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: const Color(0xFFD6D6D6)),
                ),
                child : Center(child: Text("8", style: TextStyle(fontSize: 40, color: Colors.blue,))),
              ),
              Container(
                width: b3width,
                height: b3height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: const Color(0xFFD6D6D6)),
                ),
                child : Center(child: Text("84", style: TextStyle(fontSize: 40, color: Colors.black,))),
              ),
            ]
           ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: b2width,
                  height: b4height,
                  padding : const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                    border: Border.all(width: 1.0, color: const Color(0xFFD6D6D6)),
                  ), 
                  child: Center(child:Text("""A long paragraph goes here""", style : TextStyle(fontSize: 16,color: Colors.black),),),
                ),
              ]
            ),
            const RaisedButton(
              color: Colors.red,
              onPressed: null,
              child: Text('EXIT LINE', style: TextStyle(color: Colors.white,fontSize: 15.0)),
            ),
          ]
        ),
      );
  }
}

