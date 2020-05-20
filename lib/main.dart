import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme: ThemeData(

        primaryColor: Colors.lightBlue
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyAppHomePage createState() {
    
    return _MyAppHomePage();
  }
}

class _MyHome extends State<MyHome> {
  String _ans = '',output='';
  double num1,num2,result;
  String oper='';
  void buttonPressed(String value) {
    if (value == "CE") {
      _ans='';
      num1=0.0;
      num2=0.0;
      oper='';
      output='';
    }
    else if(value=="+"||value=="-"||value=="/"||value=="*"){
      num1= double.parse(_ans);
      _ans='';
      oper=value;
    }
    else if(value=="="){
      num2=double.parse(_ans);
        if(oper=="+"){
          result=num1+num2;
        }
        if(oper=="-"){
          result=num1-num2;
        }
        if(oper=="*"){
          result=num1*num2;
        }
        if(oper=="/"){
          result=num1/num2;
        }
        _ans=result.toString();
    }
    else{
      _ans=_ans+value;
    }
    setState(() {
     output=_ans; 
    });
  }

  Widget makeBtn(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700, color: Colors.blueAccent
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),),
      ),
      body: Container(
        
        child: Column(
          children: <Widget>[
            Text(
              '$_ans',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w700, color: Colors.blueAccent,
              ), maxLines: 5,
            ),
            Expanded(
              child: Divider()
              
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    makeBtn('7'),
                    makeBtn('8'),
                    makeBtn('9'),
                    makeBtn('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeBtn('4'),
                    makeBtn('5'),
                    makeBtn('6'),
                    makeBtn('*'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeBtn('1'),
                    makeBtn('2'),
                    makeBtn('3'),
                    makeBtn('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeBtn('.'),
                    makeBtn('0'),
                    makeBtn('00'),
                    makeBtn('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeBtn('CE'),
                    makeBtn('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}