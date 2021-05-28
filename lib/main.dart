import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense App"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              color:Colors.blueGrey,
              child: Container(width: 100, child: Text("chart")),
              elevation: 5,
            ),
            Card(
              child: Text("List of TX"),
            ),
          ],
        ));
  }
}
