import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'package:flutter_tts/flutter_tts.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChantPage(),
    );
  }
}

class ChantPage extends StatefulWidget {
  @override
  _ChantPageState createState() => _ChantPageState();
}

class _ChantPageState extends State<ChantPage>  {
  final FlutterTts flutterTts = FlutterTts();
  String navSel = "Stop Watch";
  bool first = true;
  bool second = false;
  bool third = false;
  bool status = false;
  int _value = 2;
  bool sound = false;
  selectedNav(label)
  {
    setState(() {
      if(label == "Stop Watch"){
        first = true;
        second =false;
        third = false;
      }
      else if(label == "Goals"){
        first = false;
        second =true;
        third = false;
      }
      else if(label == "Gongyo"){
        first = false;
        second =false;
        third = true;
      }
      navSel = label;
    });
  }



  Future _speak() async{
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setPitch(1.1);
    await flutterTts.speak(_value == 2 ? 'Lorem ipsum is drived from the Latin "dolorem ipsum" roughly translated as pain itselforem'
        : _value == 1 ? 'लोरम इप्सम लैटिन "डोलोरेम इप्सम" से लिया गया है जिसका मोटे तौर पर अनुवाद खुद लोरेम के रूप में किया गया है'
        : _value == 3? 'Lorem ipsum est dérivé du latin "dolorem ipsum" traduit approximativement par douleur elle-même lorem'
        :null);
    sound =false;
  }





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/Background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios),


            title: Container(
              alignment: Alignment.center,
              child: Text("Chant", style: TextStyle(
                fontSize: 25.0,
              ),),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: (){
                    setState(() {
                      //function to do
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.restore,size: 37.0,)))

            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,


          ),

          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical: 6),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 9),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,

                        borderRadius: BorderRadius.circular(12)
                    ),

                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                            width: MediaQuery.of(context).size.width,


                            child: Row(


                              children: <Widget>[
                                SizedBox(width: 10.0,),
                                Flexible(
                                  child: GestureDetector(
                                    onTap : (){
                                      selectedNav("Stop Watch");
                                    },
                                    child: Container(

                                      decoration: first ?BoxDecoration(
                                          border: Border(
                                              bottom:  BorderSide(color: Colors.white, width: 2.0)
                                          )
                                      ): null,

                                      child: Text("Stop Watch",
                                        style: TextStyle(
                                          color: first ? Colors.white : Colors.white54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,

                                        ),),),
                                  ),
                                  flex: 4,
                                ),
                                Spacer(),
                                Spacer(),
                                Flexible(
                                  child: GestureDetector(
                                    onTap : (){
                                      selectedNav("Goals");
                                    },
                                    child: Container(

                                      decoration: second ?BoxDecoration(
                                          border: Border(
                                              bottom:  BorderSide(color: Colors.white, width: 2.0)
                                          )
                                      ): null,

                                      child: Text("Goals",

                                        style: TextStyle(
                                          color: second ? Colors.white: Colors.white54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,

                                        ),
                                      ),),
                                  ),
                                  flex: 3,
                                ),
                                Spacer(),
                                Spacer(),
                                Flexible(
                                  child: GestureDetector(
                                    onTap : (){
                                      selectedNav("Gongyo");
                                    },
                                    child: Container(

                                      decoration: third ?BoxDecoration(
                                          border: Border(
                                              bottom:  BorderSide(color: Colors.white, width: 2.0)
                                          )
                                      ): null,
                                      child: Text("Gongyo",
                                        style: TextStyle(
                                          color: third ? Colors.white : Colors.white54,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),),),
                                  ),
                                  flex: 4,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5,),
                          width: MediaQuery.of(context).size.width ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(8),


                                  ),
                                  child: DropdownButton(
                                    value: _value,
                                    iconSize: 13,
                                    style: TextStyle(
                                        fontSize: 10
                                    ),

                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Hindi",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                          ),),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("English",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                          ),),
                                        value: 2,
                                      ),

                                      DropdownMenuItem(
                                          child: Text("French",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black
                                            ),),
                                          value: 3
                                      )
                                    ],
                                    onChanged: (val){
                                      setState(() {
                                        _value = val;
                                      });
                                    },
                                  ),
                                ),
                                flex: 3,
                              ),
                              Spacer(),
                              Flexible(
                                child: Container(
                                  child: Transform.scale(
                                    scale: 0.58,
                                    child: LiteRollingSwitch(

                                      value: true,
                                      textOn: 'Karoke Mode',
                                      textOff: 'Other Mode',
                                      colorOn: Colors.grey,
                                      colorOff: Colors.black38,
                                      iconOn: Icons.power_settings_new,
                                      iconOff: Icons.power_settings_new,
                                      textSize: 11.0,
                                      onChanged: (bool state) {
                                        //Use it to manage the different states
                                        print('Current State of SWITCH IS: $state');
                                      },
                                    ),
                                  ),
                                ),
                                flex: 4,
                              ),Spacer(),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              sound = true;
                                              (sound == true)? _speak(): null;
                                            });
                                          },
                                          child: Icon(sound? Icons.volume_up:Icons.volume_mute)),
                                      Text("On/Off",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 10
                                        ),)
                                    ],
                                  ),
                                ),
                                flex: 2,
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  flex: 4,
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 4),
                    margin: EdgeInsets.symmetric( horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Text(navSel,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.deepPurpleAccent.withOpacity(0.25)
                          ),),
                        SizedBox(width: 20.0,),
                        Text("Silent Prayers",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.deepPurpleAccent.withOpacity(0.25)
                          ),),
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 27, vertical: 3),
                    child: SingleChildScrollView(child: MainPageFromNav(navSel,_value)),
                  ),
                  flex: 9,
                )
              ],
            ),
          ),


        ),


      ],

    );
  }
}

class MainPageFromNav extends StatefulWidget {
  final label;
  final _value;


  MainPageFromNav(this.label,this._value);

  @override
  _MainPageFromNavState createState() => _MainPageFromNavState();
}

class _MainPageFromNavState extends State<MainPageFromNav> {
  double _sizeValue = 8.5;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          Stack(
            children: [
              Container(

                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),

                color: Colors.white54.withOpacity(0.3),
                child: Column(
                  children: <Widget>[
                    Container(

                      child: Text(widget.label.toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(height: 9.0,),
                    new Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Flexible(
                          child:  RichText(
                            text: TextSpan(
                                text: widget._value ==2?'Lorem ipsum is drived from the Latin "dolorem ipsum" roughly translated as pain itselforem'
                                    :widget._value == 1?'लोरम इप्सम लैटिन "डोलोरेम इप्सम" से लिया गया है जिसका मोटे तौर पर अनुवाद खुद लोरेम के रूप में किया गया है'
                                    : widget._value == 3? 'Lorem ipsum est dérivé du latin "dolorem ipsum" traduit approximativement par douleur elle-même lorem'
                                    :null,

                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 2* _sizeValue,

                                ),
                                children: <TextSpan>[



                                  TextSpan(
                                      text: widget._value ==2?' ipsum presents the sample font and orientation of writting on orem ipsum is derived from the Latin "dolorem ipsum" roughly translated as "pain itself." '
                                          :widget._value == 1?'ओप्सम नमूना फ़ॉन्ट प्रस्तुत करता है और ओरेम इप्सम पर लेखन का उन्मुखीकरण लैटिन "डारलेम इप्सम" से लिया गया है जिसका मोटे तौर पर "दर्द ही" के रूप में अनुवाद किया गया है।'
                                          : widget._value == 3? "ipsum présente l'exemple de police et l'orientation de l'écriture sur orem ipsum est dérivée du latin «dolorem ipsum», à peu près traduit par «douleur elle-même»."
                                          :null,
                                      style: TextStyle(color: Colors.black26,
                                        fontSize: 2* _sizeValue,
                                      )
                                  )
                                ]
                            ),
                          ),
                          flex: 5,),
                        new Flexible(child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text("A-"),
                            ),
                            new RotatedBox(
                              quarterTurns: 1,
                              child: new Container(
                                margin: EdgeInsets.only(right: 7),
                                decoration: new BoxDecoration(
                                    color: Colors.transparent,
                                    boxShadow: [new BoxShadow(color: Colors.transparent, offset: new Offset(0.0, 2.0), blurRadius: 10)]),
                                child: new Slider(
                                  value: _sizeValue,
                                  activeColor: Colors.grey,
                                  inactiveColor: Colors.white,
                                  onChanged: (double s) {
                                    setState(() {
                                      _sizeValue = s;
                                    });
                                  },
                                  divisions: 20,
                                  min: 8.0,
                                  max: 11.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Text("A+"),
                            ),
                            SizedBox(height: 8.0,),
                            Text("Font size",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11
                              ),)
                          ],
                        ),flex: 1,)
                      ],
                    ),
                    Container(

                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

