import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function(String) deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: <Widget>[
              Text('No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 18,
              ),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover)),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$ ${userTransactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      )),
                  title: Text(userTransactions[index].title,
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                      DateFormat.yMMMMd().format(userTransactions[index].date),
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(userTransactions[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
