import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _char = false;
var _num = false;
var _lower = false;
var _upper = false;
var _len = 11.0;
var length;
void main() {
  runApp(
    MaterialApp(
      home: PassWordGen(),
    ),
  );
}

class PassWordGen extends StatefulWidget {
  @override
  _PassWordGenState createState() => _PassWordGenState();
}

class _PassWordGenState extends State<PassWordGen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          'Password Generator',
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CheckboxListTile(
            value: _lower,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Lowercase',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            secondary: Icon(
              CupertinoIcons.info,
              color: Colors.white,
            ),
            onChanged: (bool value) {
              setState(() {
                _lower = value;
              });
            },
            activeColor: Colors.redAccent,
            checkColor: Colors.white,
          ),
          CheckboxListTile(
            value: _upper,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'UpperCase',
              style: TextStyle(color: Colors.white),
            ),
            secondary: Icon(
              CupertinoIcons.italic,
              color: Colors.white,
            ),
            onChanged: (bool value) {
              setState(() {
                _upper = value;
              });
            },
            activeColor: Colors.redAccent,
          ),
          CheckboxListTile(
            title: Text(
              'Special Characters',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            secondary: Icon(
              CupertinoIcons.money_dollar,
              color: Colors.white,
            ),
            value: _char,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool value) {
              setState(() {
                _char = value;
              });
            },
            activeColor: Colors.redAccent,
          ),
          CheckboxListTile(
            value: _num,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              'Numbers',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            secondary: Icon(
              CupertinoIcons.number_circle,
              color: Colors.white,
            ),
            onChanged: (bool value) {
              setState(() {
                _num = value;
              });
            },
            activeColor: Colors.redAccent,
          ),
          ListTile(
            title: Text(
              'Length',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Slider(
            value: _len,
            min: 8,
            max: 25,
            label: _len.round().toString(),
            divisions: 5,
            onChanged: (double value) {
              setState(() {
                _len = value;
                length = value.round;
              });
            },
            activeColor: Colors.redAccent,
            inactiveColor: Colors.grey[900],
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              color: Colors.redAccent,
              child: Text(
                'Generate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  if (_char == false && _lower == false && _upper == false && _num == false) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'Error',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Text(
        'Select at least one option.',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Ok',
            style: TextStyle(color: Colors.redAccent),
          ),
        )
      ],
    );
  } else {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        'Your Password',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Ok',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Copy to Clipboard',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
