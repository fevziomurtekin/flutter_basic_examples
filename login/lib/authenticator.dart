import 'package:flutter/material.dart';


class Authenticator extends StatefulWidget {
  Authenticator({Key key, this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() => new _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {

  _AuthenticatorState({Key key, this.onAuthenticated});

  TextEditingController _user;
  TextEditingController _pass;
  final ValueChanged<bool> onAuthenticated;

  void _onPressed() {
    if(_user.text != 'user' || _pass.text != '1234') {
      onAuthenticated(false); // eğer user ve 1234 girdiyse basarılı olacak.
    } else {
      onAuthenticated(true);
    }
  }


  @override
  void initState() {
    _pass = new TextEditingController(); // android de textWacher ile aynı görevde.
    _user = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _user,
              decoration: new InputDecoration(labelText: 'Username'),
            ),
            new TextField(
              controller: _pass,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new RaisedButton(onPressed: _onPressed, child: new Text('Login'),),)
          ],
        ),
      ),
    );

  }
}