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
  int _value1=0;
  int _value2=0;

  void _setValue1(int value){
    setState(() => _value1=value);
  }
  void _setValue2(int value){
    setState(() => _value2=value);
  }

  Widget makeRadios(){
    List list=new List();
    for(int i=0;i<3;i++){
      list.add(new Radio(value: i, groupValue: _value1, onChanged: _setValue1));
    }
    Column column=new Column(children: list,);
    return column;

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
             makeRadios()
            ],
          ),
        ),
      ),
    );
  }

}