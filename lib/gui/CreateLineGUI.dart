import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateLineGUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateLineGUIState();
  } 
}

class CreateLineGUIState extends State<CreateLineGUI> { 
  String _name;
  String _lineName;
  String _telephoneNo;
  String _email;
  String _maxNo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLine() {
     return TextFormField(
      decoration: InputDecoration(labelText: 'Line Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Line Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _lineName = value;
      },
    );
  }

  Widget _buildTelephoneNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Telephone Number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _telephoneNo = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      }
    );
  }

  Widget _buildMaxNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Maxium Number of Queue'),
      keyboardType: TextInputType.number,
      validator: (String value) {

        int maxNo = int.tryParse(value);

        if (maxNo == null || maxNo <= 0) {
          return 'A maximum number is required and must be greater than zero';
        }
        return null;
      },
      onSaved: (String value) {
        _maxNo = value;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CREATE LINE"), backgroundColor: Colors.tealAccent[400],),
      
      body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView (
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildLine(),
                _buildTelephoneNo(),
                _buildEmail(),
                _buildMaxNo(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()){
                      return;
                    }

                    _formKey.currentState.save();

                  print(_name);
                  print(_lineName);
                  print(_telephoneNo);
                  print(_email);
                  print(_maxNo);
                },
              ),
            ]
          ),
        )
      )
    )
 );         
  }
}
