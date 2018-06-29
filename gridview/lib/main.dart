import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}

class Area{
  int index;
  String name;
  Color color;
  Area({this.index:-1,this.name:'Area',this.color:Colors.lightBlue});
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  int location;
  List<Area> areas;

  @override
  void initState() {
    // Baslangıçta atama yapılan fonksiyon.
    // TODO: implement initState
    areas = new List<Area>();
    for (int i = 0; i < 16; i++) {
      areas.add(new Area(index: i, name: 'Area ${i}'));
    }
    var rng=new Random();
    location=rng.nextInt(areas.length);
  }
   // rastgele renk vermek için oluşturduk.

    void _onPressed(int index){
      setState((){
        if(index == location) {
          areas[index].color = Colors.green;
          //You won
        } else {
          areas[index].color = Colors.red;
        }
      });
    }

    Widget _generate(int index) {
      return new GridTile(
          child: new Container( // android deki adapterdeki layout alanına benzer.
            padding: new EdgeInsets.all(5.0),
            child: new RaisedButton(
              onPressed: () => _onPressed(index),
              color: areas[index].color,
              child: new Text(areas[index].name, textAlign: TextAlign.center),

            ),
          )
      );
    }

    void onPressed(index){
      setState(() {
        if(index==location){ // rastgele seçilen alanı doğru bilirse yeşil, yanlış bilirse kırmızı renkte olacak.
          areas[index].color=Colors.green;
        }else{
          areas[index].color=Colors.red;
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new GridView.count(
              crossAxisCount: 4,// yan yana kac tane alan olacagı belirleniyor.
              children: new List<Widget>.generate(16,_generate),
          )
        ),
      ),
    );
  }
}

