import 'package:flutter/material.dart';
import './widgets/transactionList.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'Guitar', amount: 78.93, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Cellphone', amount: 35.98, date: DateTime.now()),
    Transaction(
        id: '3', title: 'Yuri Jahad', amount: 58.56, date: DateTime.now()),
  ];
  void _addNewTransaction(String newTitle, double newAmount) {
    final newTransaction = Transaction(
        title: newTitle,
        amount: newAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startNewTransaction(context),
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
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
          TransactionList(_userTransactions),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
