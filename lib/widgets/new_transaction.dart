import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    String newTitle = titleController.text;
                    double newAmount = double.parse(amountController.text);
                    addTransaction(newTitle,newAmount);
                  },
                  child: Text('Add Transaction',
                      style: TextStyle(color: Colors.purple))),
            ],
          ),
        ));
  }
}
