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

  void onClick(){
    setState(() {
      _value="Hello world, I am Omur"; // buttona tıklanınca yazıyı değiştirmek icin fonksiyon yaptık.
    });
  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
      ),
      drawer: new Drawer( // drawer eklendi.
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text("Hello Drawer"),
              new RaisedButton(onPressed: ()=>Navigator.pop(context),child: new Text("Close"),) //Navigator.pop drawerı kapatmak demek.
            ],
          ),
        ),
      ),
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