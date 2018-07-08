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
  final Key mapPage = PageStorageKey('map');
  final Key poolPage = PageStorageKey('pool');
  final Key schoolPage = PageStorageKey('school');

  int currentTab = 0;
  Maps maps;
  Pools pools;
  Schools schools;
  List<Widget> pages;
  Widget currentPage;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    // TODO: implement initState

    maps=new Maps(
      key:mapPage,
    );

    pools=new Pools(
      key: poolPage,
    );

    schools=new Schools(
      key:schoolPage,
    );

    pages=[maps,pools,schools];
    currentPage = maps;
    super.initState();

  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Bottom Navigation"),
      ),
      body:PageStorage(
        bucket: bucket,
        child: currentPage) ,
        bottomNavigationBar:new BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index){
        setState(() {
        currentTab=index; // tapa tıklanınca indexini verdik ona göre sayfa değişecek.
        currentPage=pages[index];
      });
    },
      items: [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.map),
        title: new Text(
        "Map",
        style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0
        ),)),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.pool),
        title: new Text("Pool",
        style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0
        ),)),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.school),
        title: new Text("School",
        style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0
        ),)),
        ]),
    );
  }

}

class Maps extends StatefulWidget{
    Maps({Key key}) : super(key:key);

  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<Maps>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0)),
          new Text("Map",style: new TextStyle(fontWeight:FontWeight.bold),),
        ],
      ),
    );
  }
}


class Pools extends StatefulWidget{
  Pools({Key key}) : super(key:key);

  @override
  PoolsState createState() => PoolsState();
}

class PoolsState extends State<Pools>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0)),
          new Text("Pool",style: new TextStyle(fontWeight:FontWeight.bold),),
        ],
      ),
    );
  }
}


class Schools extends StatefulWidget{
  Schools({Key key}) : super(key:key);

  @override
   SchoolsState createState() => SchoolsState();
}

class SchoolsState extends State<Schools>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0)),
          new Text("School",style: new TextStyle(fontWeight:FontWeight.bold),),
        ],
      ),
    );
  }
}