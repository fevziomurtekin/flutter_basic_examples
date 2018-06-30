import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Home extends StatefulWidget{
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

  TextEditingController _name;
  GlobalState _store=GlobalState.instance;

  @override
  void initState() {
    // TODO: implement initState

    _name=new TextEditingController();
    _store.set("name", "");
    _name.text=_store.get("name"); // androiddeki putextra gibi dinamik veri oluşturup diğer sayfaya yolluyoruz.
  }

  void _onPressed(){ //click verdik.
      _store.set("name", _name.text);
      Navigator.of(context).pushNamed("/Second");

  }

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
              new TextField(
                controller: _name,
                decoration: new InputDecoration(labelText: "İsminizi giriniz..."),
              ),
              new RaisedButton(
                onPressed:_onPressed, // routes da tanımladığımız sayfanın ismine göre navigator yönlendirme yapıyor.
                child: new Text("next"),)
            ],
          ),
        ),
      ),
    );
  }
}

