import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonpressed(String buttonvalue) {
    if (buttonvalue == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else if(buttonvalue=="+"||buttonvalue=="-"||buttonvalue=="X"||buttonvalue=="/"){
      num1 = double.parse(output);
      operand = buttonvalue;
      _output="0";
  }
  else if(buttonvalue==".")
  {
    if(_output.contains(".")){
      return;
    }
    else{
      _output = _output +buttonvalue;
    }
  }
  else if(buttonvalue=="="){
    num2 = double.parse(output);
    if(operand=="+"){
      _output = (num1 + num2).toString();
    }
    if(operand=="-"){
      _output = (num1 - num2).toString();
    }
    if(operand=="X"){
      _output = (num1 * num2).toString();
    }
    if(operand=="/"){
      _output = (num1 / num2).toString();
    }
    num1 = 0.0;
    num2 = 0.0;
    operand= "";
  }
  else{
    _output = _output + buttonvalue;
  }
  
  print(_output);
  setState(() {
   output = double.parse(_output).toStringAsFixed(1);
  });
  }
  Widget buildbutton(String buttontext) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonpressed(buttontext),
        textColor: Colors.black,
      ),
    );
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 12,
                  ),
                  child: new Text(
                    output,
                    style: new TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold),
                  )),
              new Expanded(
                child: new Divider(),
              ),
              Column(
                children: <Widget>[
                  new Row(children: [
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/"),
                  ]),
                  new Row(children: [
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton('X'),
                  ]),
                  new Row(children: [
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("-"),
                  ]),
                  new Row(children: [
                    buildbutton("."),
                    buildbutton("0"),
                    buildbutton("00"),
                    buildbutton("+"),
                  ]),
                  new Row(children: [
                    buildbutton("Clear"),
                    buildbutton("="),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
  }