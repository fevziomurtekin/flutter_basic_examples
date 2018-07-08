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
  final GlobalKey<ScaffoldState> globalKey=new GlobalKey<ScaffoldState>();

  void showSnackbar() {
    globalKey.currentState.showSnackBar(
        new SnackBar(content: new Text("Settings"))); //SnackBar oluşturuldu.
  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold(
      key: globalKey, // key veriyoruz. Snackbar için.
      appBar: new AppBar(
        title: new Text("Snackbar"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new RaisedButton(onPressed: showSnackbar,child:new Text("Show SnackBar"))
            ],
          ),
        ),
      ),
    );
  }

}