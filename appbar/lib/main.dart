import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{
  int _value=0;
  void add(){setState(() => _value=_value++);}
  void remove(){setState(() => _value=_value--);}

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
        backgroundColor: Colors.red, // appbar.
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: remove)
        ],
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new Text(_value.toString(),style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0
              ),),
            ],
          ),
        ),
      ),
    );
  }

}