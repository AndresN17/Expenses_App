import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Guitar', amount: 78.93, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Cellphone', amount: 345.98, date: DateTime.now()),
    Transaction(
        id: '3', title: 'Yuri Jahad', amount: 5809.56, date: DateTime.now()),
  ];
  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense App"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueGrey,
                child: Text("chart"),
                elevation: 5,
              ),
            ),
            Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                        /*onChanged: (value) {
                          titleInput = value;
                        },*/
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        /*onChanged: (value) {
                          amountInput = value;
                        },*/
                      ),
                      FlatButton(
                          onPressed: () {
                            print(titleController.text);
                          },
                          child: Text('Add Transaction',
                              style: TextStyle(color: Colors.purple))),
                    ],
                  ),
                )),
            Column(
              children: transactions.map((transaction) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text('\$ ${transaction.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple)),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transaction.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(DateFormat.yMMMMd().format(transaction.date),
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}
