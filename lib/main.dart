import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputvalue = "";
  String calculatedvalue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            
            SizedBox(height: 60,),
            Container(
              
              alignment: Alignment.bottomRight,
              child: Text(
                inputvalue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [
                
                Row(
                  children: [
                    calcButton("7", Colors.white38),
                    calcButton("8", Colors.white38),
                    calcButton("9", Colors.white38),
                    calcButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("4", Colors.white38),
                    calcButton("5", Colors.white38),
                    calcButton("6", Colors.white38),
                    calcButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("3", Colors.white38),
                    calcButton("2", Colors.white38),
                    calcButton("1", Colors.white38),
                    calcButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white38),
                    calcButton(".", Colors.white38),
                    calcButton("=", Colors.orange),
                    calcButton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            calcButton("Clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputvalue = "";
            calculatedvalue = "";
            operator = "";
          });
        } else if (text == "*" || text == "-" || text == "/" || text == "+") {
          setState(() {
            calculatedvalue = inputvalue;
            inputvalue = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            
            double calc = double.parse(calculatedvalue);
            double input = double.parse(inputvalue);
            if (operator == "*") {
              inputvalue = (calc * input).toString();
            } else if (operator == "-") {
              inputvalue = (calc - input).toString();
            } else if (operator == "+") {
              inputvalue = (calc + input).toString();
            } else if (operator == "/") {
              inputvalue = (calc / input).toString();
            }
            
          });
        } else {
          setState(() {
            inputvalue = inputvalue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        height: size,
        width: size,
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
