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
  List<BottomNavigationBarItem> items;
  String _values="";
  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items=new List();
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.map), title: new Text("Map")));
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.poll), title: new Text("Poll")));
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.school), title: new Text("Scholl")));
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
              new Text(_values),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: items, // itemini atadık.
        fixedColor: Colors.red, //tıklanınca iconunun rengini değişterecek rengi değiştirdik.
        currentIndex: index,
        onTap: (int item){
          setState(() {
            index=item;
            _values=" Current value is : ${index.toString()}";
          });
        },
      ), // Alt menu de tab bar oluşturdu.
    );
  }

}