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
  bool _value1=false;
  bool _value2=false;

  void valueOnchanged(bool value){setState(()=> _value1=value );}// onchanged metodları.
  void valueOnchangeds(bool value){setState(()=> _value2=value );}// onchanged metodları.


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
              new Checkbox(value: _value1, onChanged: valueOnchanged),
              new CheckboxListTile(value: _value2
                  , onChanged: valueOnchangeds,
                title: new Text(_value2.toString()),
                controlAffinity: ListTileControlAffinity.leading, // sağ tarafına aldık title.
                subtitle: new Text("subtitle"),
                secondary: new Icon(Icons.archive), // icon ekledik.
                activeColor: Colors.red, // active olursa rengini değiştirttik. Background rengi değişti.
              ),
            ],
          ),
        ),
      ),
    );
  }

}