import 'package:flutter/material.dart';


class Second extends StatefulWidget{
  @override
  _Second createState() => new _Second();
}

class _Second extends State<Second> {

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Text("Welcome Seconds"),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Third', (Route)=>true);}, // Route true ise geri gelme iconu geliyor. ve back iconuna tıklayınca geri geliyor.
                child: new Text("next"),),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pushNamed("/Home");},
                child: new Text("back"),),
            ],
          ),
        ),
      ),
    );
  }
}

