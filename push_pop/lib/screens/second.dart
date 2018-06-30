import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Second extends StatefulWidget{
  Second(this.name);
  String name;
  @override
  /*_Second createState() => new _Second();*/
  _Second createState() => new _Second(name); // sınıfa veri atayıp o veriyi çekerek de yapılabilir. Fragment newInstance yapısı gibi.
}

class _Second extends State<Second> {
  _Second(this.name);
  String name;

  GlobalState state=GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi b azı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Second"), // yolladığımız veriyi "name" value ile cekip, yazdırıyoruz
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
            /*  new Text("Hello ${state.get("name")}"),*/
              new Text("Hello ${name}"),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Third', (Route<dynamic>route)=>false);}, // Route true ise geri gelme iconu geliyor. ve back iconuna tıklayınca geri geliyor.
                child: new Text("next"),),
              new RaisedButton(
                onPressed: (){Navigator.of(context).pop();}, // navigatationdan cıkardık.
                child: new Text("back"),),
            ],
          ),
        ),
      ),
    );
  }
}

