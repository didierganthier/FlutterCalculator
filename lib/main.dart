import 'package:flutter/material.dart';

void main() => runApp(SimpleCalculator());

class SimpleCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SimpleCalculatorState();
}

class SimpleCalculatorState extends State<SimpleCalculator>{
  var num1 = 0, num2 = 0, answer = 0;

  final TextEditingController firstNumber = TextEditingController(text: "");
  final TextEditingController secondNumber = TextEditingController(text: "");

  bool checkNumbers(){
    try{
      num1 = int.parse(firstNumber.text);
      num2 = int.parse(secondNumber.text);
      return true;
    } on FormatException catch(e){
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Number")
      ));
      setState(() {
        answer = 0;
      });
      return false;
    }
  }

  void add(){
    if(checkNumbers())
      setState(() {
        answer = num1 + num2;
      });
  }

  void subtract(){
    if(checkNumbers())
      setState(() {
        answer = num1 - num2;
      });
  }

  void multiply(){
    if(checkNumbers())
      setState(() {
        answer = num1 * num2;
      });
  }

  void division(){
    if(checkNumbers())
      setState(() {
        try{
          answer = num1 ~/num2;
        }on IntegerDivisionByZeroException catch(e){
          answer = 0;
        }
      });
  }

  void doClear(){
    setState(() {
      firstNumber.text = "";
      secondNumber.text = "";
      answer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Simple Calculator",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter first number",
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                  controller: firstNumber,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter second number',
                    hintStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                  controller: secondNumber,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Output: $answer",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: add,
                    ),
                    RaisedButton(
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: subtract,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "*",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: multiply,
                    ),
                    RaisedButton(
                      child: Text(
                        "/",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: division,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      color: Colors.redAccent,
                      onPressed: doClear,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}