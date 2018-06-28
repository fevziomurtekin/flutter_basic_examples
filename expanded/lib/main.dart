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
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyO8QL6UKbT4BYc8JOS0IK93TZuxI9iy5VBpHOvI4OxYdlJDT83t7TTw")// buton tıklanınca calışacak fonksiyon ve textini değiştirdik.
            ],
          ),
        ),
      ),
    );
  }

}