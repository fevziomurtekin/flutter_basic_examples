import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

  Map countries=new Map();

  void getData() async{ // verileri asekron çekiyor.
  var url="http://country.io/names.json";
  var response=await http.get(url); // veriyi çekiyoruz.
    if(response.statusCode==200){
      setState(() =>countries=JSON.decode(response.body));
    }
  }
  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.

   /* getData();*/ // datayı çekmek için oluşturulan sınıfı çağırdık. veya initState yapabilirsin.

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
              new Text("Countries",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              new Expanded(child: new ListView.builder(
                itemCount: countries.length, // boyutunu atadık.
                itemBuilder: (BuildContext context,int index){
                  String key=countries.keys.elementAt(index);
                  return new Row(
                    children: <Widget>[
                      new Text("${key}"), // indexini cekti.
                      new Text("${countries[key]}"), // veriyi cekti. yazdırdı.
                    ],
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
  }
}