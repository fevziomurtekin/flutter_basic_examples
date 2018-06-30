import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

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
              new Text("Welcome Home"),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pushNamed("/Second");}, // routes da tanımladığımız sayfanın ismine göre navigator yönlendirme yapıyor.
                child: new Text("next"),)
            ],
          ),
        ),
      ),
    );
  }
}

