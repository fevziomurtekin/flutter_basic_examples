import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}
class Sales{
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}
class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<Sales> _data;
  List<charts.Series<Sales,int>> _chartdata;

  void _makeData(){
    _chartdata=new List<charts.Series<Sales,int>>();
    _data=<Sales>[
      new Sales(0,100, charts.MaterialPalette.red.shadeDefault),
      new Sales(25,75, charts.MaterialPalette.deepOrange.shadeDefault),
      new Sales(50,50, charts.MaterialPalette.yellow.shadeDefault),
      new Sales(100,00, charts.MaterialPalette.cyan.shadeDefault),
      // verileri atadık.
    ];

    _chartdata.add(new charts.Series(
        id: 'Sales',
        data: _data,
        domainFn: (Sales sales,_)=>sales.year,
        measureFn:  (Sales sales,_)=>sales.sales,
        colorFn: (Sales sales,_)=>sales.color,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("Oval Charts"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Expanded(
                  child: new charts.PieChart<Sales,int>(
                    _chartdata,
                    animate: true,
                    animationDuration: new Duration(seconds: 5),// animate verdik.
               )),
            ],
          ),
        ),
      ),
    );
  }
}

