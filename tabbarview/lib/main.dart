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
class Choice{
  final String footballers;
  final String footballers_url;

  const Choice({this.footballers,this.footballers_url});
}
class _State extends State<MyApp> with SingleTickerProviderStateMixin{ //2 tane birden kalıtım yapılabiliyor.
  // Tab bar için tab ekliyoruz.

  TabController controller;
  List<Choice> _items=const <Choice>[
    const Choice(footballers:'Metin Oktay',footballers_url: "http://www.yenicaggazetesi.com.tr/d/other/metin-oktay-001.jpg"),
    const Choice(footballers:"Ghorge Hagi",footballers_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN5Lb1JT3hGeKeFhIwBJz8Qzl2hqYaZieCjcTJl_pHfPMC4Oh3Ig"),
    const Choice(footballers:"Fatih Terim",footballers_url: "https://haberyenisoz.com/uploads/data/News/3258/fatih-terim-operasyona-basliyor-1513951026-1843471.jpg"),
    const Choice(footballers:"Metin Kurt",footballers_url: "https://www.bilgiustam.com/resimler/2014/07/5359_6f5bfa9d3f4c48924523c2629eeb4cb8-300x300.jpg"),
];

  @override
  void initState() {
    // TODO: implement initState
    controller=new TabController(length: _items.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Galatasaray", // appbar title düzenlendi.
          textAlign: TextAlign.center,
          style:new TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold
          ) ,),
        backgroundColor: Colors.red,
        bottom: new PreferredSize( //indicator ekledik üst tarafına.
            child:new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(controller: controller,),
                )),
            preferredSize:  const Size.fromHeight(48.0),
        ),
      ),
      body: new TabBarView(
          controller: controller,
          children: _items.map((Choice items){
            return new Container(
              padding: EdgeInsets.all(25.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(items.footballers),
                    new Image.network(items.footballers_url)
                  ],
                ),
              ),
            );
          }).toList())
    );
  }

}