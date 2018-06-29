import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts; // ilk önce yaml daki despencies bölümüne ekleyip sonra buraya ekliyoruz.

void main(){
  runApp(new MaterialApp(
    home: new MyApp(), // burada homepagenin hangisi olacağına karar verilir. (İlk hangi sayfa çalıştırılacak)
  ));
}

class Sales{
  String year;
  int sales;
  Sales(this.year,this.sales);
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<Sales> _data;
  List<charts.Series<Sales,String>> _chartdata;

  void _makeData(){
    _data=new List<Sales>();
    _chartdata=new List<charts.Series<Sales,String>>();
    
    // random data oluşuturuyoruz.
    final random=new Random();
    for(int i=2010;i<2019;i++){
      _data.add(new Sales(i.toString(),random.nextInt(1000))); // dataya atıyoruz. (i = year anlamına geliyor örnekte.
      // random atananda valuesi.
    }
    _chartdata.add(new charts.Series(
      // dataları charts e ekledik. Charts in nasıl olacagına karar verdik.
        id: "Sales",
        data: _data,
        colorFn: (_,__)=>charts.MaterialPalette.red.shadeDefault,
        domainFn:(Sales sales, _) =>sales.year,
        measureFn: (Sales sales, _)=> sales.sales,
        fillPatternFn: (_,__)=> charts.FillPatternType.solid,
        displayName: 'sales'
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
        title: new Text("Charts"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // center vertical=true.
            children: <Widget>[
              new Text("Sales Data"),
              new Expanded(child: new charts.BarChart<Sales>(_chartdata)) // chartsi layouta ekledik.
            ],
          ),
        ),
      ),
    );
  }
}

