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


  showPopup(){
    showModalBottomSheet<void>(
        context: context, //activity in contextini verdik.
        builder: (BuildContext context){
          return new Container(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("WARNİNG",style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),),
                new RaisedButton(onPressed: ()=>Navigator.pop(context),
                  textColor: Colors.black12,
                child: new Text("Close"),) //raisedbutton tanımladık. Popup ın kapanması için click verdik. (dialog.dismiss()).
              ],
            ),
          );
        }
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
              new Text(_value),
              new RaisedButton(onPressed: ()=> showPopup(),child: new Text("Show dialog"),)
            ],
          ),
        ),
      ),
    );
  }

}