import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}
class Sales{
  String year;
  int sales;

  Sales(this.year,this.sales);
}

class _State extends State<MyApp> {

  List<Sales> _laptops;
  List<Sales> _desktops;
  List<charts.Series<Sales,String>> _chartdata;

  void _makeData(){
    _laptops=new List<Sales>();
    _desktops=new List<Sales>();
    _chartdata=new List<charts.Series<Sales,String>>();
    
    final random =new Random();
    for (int i=2016;i<2019;i++){
      _laptops.add(new Sales(i.toString(),random.nextInt(1000)));
      _desktops.add(new Sales(i.toString(),random.nextInt(1000)));
    }
    
    _chartdata.add(new charts.Series(
        id: 'Sales',
        data: _laptops,
        domainFn: (Sales sales,__) =>sales.year,
        measureFn: (Sales sales,__) =>sales.sales,
        displayName: 'Sales',
        colorFn: (_,__)=>charts.MaterialPalette.red.shadeDefault));

    _chartdata.add(new charts.Series(
        id: 'Sales',
        data: _desktops,
        domainFn: (Sales sales,__) =>sales.year,
        measureFn: (Sales sales,__) =>sales.sales,
        displayName: 'Sales',
        colorFn: (_,__)=>charts.MaterialPalette.yellow.shadeDefault));
  }

  // diğer örnekten farkı 2 farklı liste oluşturup onları yükledik , Chartsa.

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
        title: new Text("First App"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Expanded(child: new charts.BarChart<Sales>(_chartdata))
            ],
          ),
        ),
      ),
    );
  }
}

