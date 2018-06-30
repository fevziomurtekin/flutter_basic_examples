import 'package:flutter/material.dart';


class Third extends StatefulWidget{
  @override
  _Third createState() => new _Third();
}

class _Third extends State<Third> {

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Text("Welcome Third"),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pushNamed("/Second");},
                child: new Text("back"),),
            ],
          ),
        ),
      ),
    );
  }
}

