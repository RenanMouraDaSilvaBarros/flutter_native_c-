import 'package:clangapp/native_add.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final numberOne = TextEditingController();

  final numerTwo = TextEditingController();
  int result;
  String operator;
  String expression = "";

  calculate() {
    if (numberOne.text.isNotEmpty && numerTwo.text.isNotEmpty)
      setState(() {
        result = nativeAdd(int.parse(numberOne.text), int.parse(numerTwo.text));
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    numberOne.text = "";
    numerTwo.text = "";
    operator = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("C++")),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("insira um numero:", style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: numberOne,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "+",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              Text("insira um numero:", style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: numerTwo,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed: calculate, child: Text("Calcular")),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "Resultado:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(result == null?"" :result.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
