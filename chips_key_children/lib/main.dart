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

  int counter=0;
  List<Widget> list=new List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Verilerin ilk başta aktarılacağı yer. List viewe verileri aktaracağımız yer.
    for(int i=0;i<5;i++){  // başlangıçta 5 tane item biz ekledik.
      Widget child=newItem(i);
      list.add(child);
    }
  }

  void onClicked(){
    Widget child=newItem(counter);   // counterı her eklediğimizde 1 arttırırız.
    setState(()=>list.add(child));  // flaticona tıklanınca ise sırasıyla üstüne koya koya liste item ekler.
  }

  Widget newItem(int i){
    Key key=new Key('item_${i}');  // keyine item_i değişkenini atarız. Daha sonra silerken listin itemina göre karşılaştırma yaparak sileriz.
    Container child=new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: new Chip(  // Chip ise adapter içindeki itemdır. Itemın tasarımını yaparız. Ozelleştirmiş listview bu şekilde yapılır.
          label: new Text('${i} Name here'), // etiketini verdik. Yani adını.
        deleteIconColor: Colors.red, // rengini verdik.
        deleteButtonTooltipMessage: "Delete", // toast mesajı bastırıyoruz.
        onDeleted: ()=> removeItem(key), // delete işleminin yolunu veriyoruz.
        avatar: new CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text(i.toString()),
        ) ,
      ),
    );
    counter++;
    return child;
  }

  void removeItem(Key key){
    for(int i=0;i<list.length;i++){
      Widget child=list.elementAt(i);  // listin keylerini teker teker çekip tıklanılan itemin keyi ile karşılaştırırız.
      if(child.key==key){
        setState(()=>list.removeAt(i));
        print("Removed");
      }
    }
  }

  @override
  Widget build(BuildContext context) { // burada ise layout u oluştururuz.
    // TODO: implement build
    return new Scaffold( // app bar gibi bazı materiallerin bulunduğu sınıf.
      appBar: new AppBar(
        title: new Text("First App"),
      ),
      floatingActionButton: new FloatingActionButton( // flat button ile tıklanınca listviewin görülmesini sağlayacagız..
          onPressed: onClicked,
          child: new Icon(Icons.add),),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center( // center horizontal=true
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertical=true.
            children: list, // Widget şeklinde oluşturduğumuz listi atadık.
          ),
        ),
      ),
    );
  }

}