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
  String _value="Hello World";
  int _values=0;// değişken tanımlıyoruz.

  void onClick(){
    setState(() {
      _value=DateTime.now().toString(); // buttona tıklanınca şimdiki tarihi yazdıracağız.
    });
  }

  void add(){
    setState(() {
    _values++;
    });
  }

  void substract(){
    setState(() {
      _values--;
    });
  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new Text(_value),
              new Text('Value = ${_values}'),
              new FlatButton(onPressed: onClick,child:new Text("Click me"),), // buton tıklanınca calışacak fonksiyon ve textini değiştirdik.
              new IconButton(icon: new Icon(Icons.add), onPressed: add), // iconbutton eklendi.
              new IconButton(icon: new Icon(Icons.remove), onPressed: substract), //iconbutton eklendi.
            ],
          ),
        ),
      ),
    );
  }

}