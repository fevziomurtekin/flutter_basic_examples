import 'package:flutter/material.dart';
import 'clock.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Text("Time is"),
              new Clock() // kalıtım aldığımız nesneyi yazdırdık. Bu da sadce bize text değeri dönecek.
            ],
          ),
        ),
      ),
    );
  }
}

