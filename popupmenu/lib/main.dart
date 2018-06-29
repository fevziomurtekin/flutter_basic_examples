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
enum Animals{Cat,Dog,Bird,Lizard,Fish}

class _State extends State<MyApp>{

  Animals selected= Animals.Cat; // Default olarak kediye atıyorum.
  String value= "Make a selection";
  List _items=new List();

  @override
  void initState() {
    // TODO: implement initState
    for(Animals animal in Animals.values){ // android deki foreach yapısını : yerine in ifadesini getirerek yapmış.
      _items.add(new PopupMenuItem(
          child: new Text(getDisplay(animal)),
          value:animal
      ));
    }
  }

  void _onSelected(Animals animal){
    setState(() {
      selected=animal;
      value="You selected ${getDisplay(animal)}";
    });
  }

  String getDisplay(Animals animal){
    int index=animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
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
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new Text(value),
              ),
              new PopupMenuButton<Animals>( // android deki Spinner ile aynı işlevi görüyor.
                icon: new Icon(Icons.input),
                  initialValue: Animals.Cat,
                  onSelected: _onSelected,
                  itemBuilder: (BuildContext context){
                    return _items;
                  })
            ],
          ),
        ),
      ),
    );
  }

}