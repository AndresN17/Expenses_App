import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'Guitar', amount: 78.93, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Cellphone', amount: 345.98, date: DateTime.now()),
    Transaction(
        id: '3', title: 'Yuri Jahad', amount: 5809.56, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
