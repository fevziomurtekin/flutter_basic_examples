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

class _State extends State<MyApp> {

  List<Step> _steps;
  int _current;

  @override
  void initState() {
    // TODO: implement initStatex

    //Stepleri tanımladık.
    _current=0;
    _steps=<Step>[
      new Step(title: new Text("Step 1"), content: new Text("Merhaba Uygulamaya hoşgeldin..."),isActive: false),
      new Step(title: new Text("Step 2"), content: new Text("Seni biraz bilgilendireyim..."),isActive: false),
      new Step(title: new Text("Step 3"), content: new Text("Flutter kullanmaya yeni başladım."),isActive: false),
    ];
  }

  void _stepContinue(){
    setState(() {
    _current++;
    if(_current>=_steps.length) _current=_steps.length-1;
    });
  }
  void _stepCancel(){
    setState(() {
      _current--;
      if(_current>=_steps.length) _current=_steps.length-1;
    });
  }

  void _stepTap(int index){
    setState(() {
      _current=index;
    });
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
          child: new Stepper(
            steps: _steps,
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
          ),
        ),
      ),
    );
  }
}

