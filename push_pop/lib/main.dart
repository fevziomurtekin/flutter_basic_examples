import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';
import './screens/third.dart';
void main() => runApp(new MyApp()); // ilk myapp i çalıştırıp ona göre router(yönlendiriyoruz).

class MyApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Navigation",
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext contrex)=>new Home(),
        '/Second': (BuildContext contrex)=>new Second(),
        '/Third': (BuildContext contrex)=>new Third(),
      },
      home: new Home(),// ana sayfayı home belirledik. diğer sayfaları ise routes de belirledik.
    );
  }
}