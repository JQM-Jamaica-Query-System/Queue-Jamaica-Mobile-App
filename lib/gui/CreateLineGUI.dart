import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gui2/data/Host.dart';
import 'package:gui2/data/JQueue.dart';
import 'package:gui2/data/QJMApp.dart';

void main() {
  QJMApp app = new QJMApp();
  runApp(MaterialApp( home: CreateLineGUI(app)));
  int countH = 0;

  print("ALL HOSTS IN SYSTEM");
  for (Host host in app.getHosts()) {
    print(host.getDetails() + "\n");
    countH+=1;
  }
  print("There is " + countH.toString() + " hosts in the system.");

  int countQ = 0;

  print("ALL QUEUES IN SYSTEM");
  for (JQueue queue in app.getQueues()) {
    print(queue.getDetails() + "\n");
    countQ+=1;
  }
  print("There is " + countQ.toString() + " queues in the system.");

}

class CreateLineGUI extends StatefulWidget {
  QJMApp app;
  
  CreateLineGUI(app) {
    this.app = app;
  }
  @override
  State<StatefulWidget> createState() {
    return CreateLineGUIState(app);
  } 
}

class CreateLineGUIState extends State<CreateLineGUI> { 
  QJMApp app;
  String _name;
  String _lineName;
  String _telephoneNo;
  String _email;
  String _maxNo;
  String _alertNo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  CreateLineGUIState(app) {
    this.app = app;
  }
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
      decoration: InputDecoration(labelText: 'Maximum Number of Queue'),
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

  Widget _buildAlertNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Alert Number of Queue'),
      keyboardType: TextInputType.number,
      validator: (String value) {

        int alertNo = int.tryParse(value);

        if (alertNo == null || alertNo <= 0) {
          return 'An alert number is required and must be greater than zero';
        }
        return null;
      },
      onSaved: (String value) {
        _alertNo = value;
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
                _buildAlertNo(),
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

                  int max = int.tryParse(_maxNo);
                  int alert = int.tryParse(_alertNo);
                  Host host = new Host(_name, _telephoneNo, _email);
                  JQueue queue = new JQueue(_lineName, max , alert, host);
                  host.addQueue(queue);
                  app.createHost(host);
                  app.createQueue(queue, host);
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
