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
  String _value="Hello World"; // değişken tanımlıyoruz.

  void onClick(String value){
    setState(() {
      _value=value; // buttona tıklanınca yazıyı değiştirmek icin fonksiyon yaptık.
    });
  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed:() => onClick("timers")),
        new IconButton(icon: new Icon(Icons.poll), onPressed:() => onClick("poly")),
        new IconButton(icon: new Icon(Icons.map), onPressed:() => onClick("map"))
      ],
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new Text(_value),
            ],
          ),
        ),
      ),
    );
  }

}