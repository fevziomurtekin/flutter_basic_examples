import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget{
  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<Clock> {

  String value = 'Time here';
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    _timer =
    new Timer.periodic(new Duration(seconds: 1), _onTimer); // timer tanımladık.
  }

  void _onTimer(Timer timer) {
    var now = new DateTime.now(); // simdiki zamanı atadık.
    var formated = new DateFormat("hh:mm:ss"); //formatını belirttik.
    String formatDate = formated.format(
        now); // o formata cevirip değişkene atadık.
    setState(() {
      value = formatDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
        value,
    style: new TextStyle(
      fontWeight: FontWeight.bold
    ),); // sadece tarihi belirten bir text döndürdük. Bu sınıfı kalıtım alıp diğer sınıfın layout kısmında kullanacagız.

  }

}

