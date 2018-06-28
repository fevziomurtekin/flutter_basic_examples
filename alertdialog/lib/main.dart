import 'package:flutter/material.dart';
import 'dart:async';

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

  Future showAlert(BuildContext context,String title,String message){
    return showDialog(
        context: context,
      child: new AlertDialog(
        title: new Text(title
          ,style:TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 17.0
          ),),
        actions: <Widget>[
        new FlatButton(onPressed: ()=>Navigator.pop(context), child: new Text("ok")) // Button eklendi.
        ],
      )
    );

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
              new RaisedButton(onPressed: ()=>showAlert(context, "HEY YOU!","Do you like flutter, I do!")
                ,child: new Text("Show Alert"),)
            ],
          ),
        ),
      ),
    );
  }

}