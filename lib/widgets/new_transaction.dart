import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function(String, double) addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTransaction);

  void submitData() {
    String newTitle = titleController.text;
    double newAmount = double.parse(amountController.text);
    if (newTitle.isEmpty || newAmount <= 0) return;
    addTransaction(newTitle, newAmount);
  }

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
                onSubmitted: (_) => submitData(),
                /*onChanged: (value) {
                          titleInput = value;
                        },*/
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                /*onChanged: (value) {
                          amountInput = value;
                        },*/
              ),
              FlatButton(
                  onPressed: submitData,
                  child: Text('Add Transaction',
                      style: TextStyle(color: Colors.purple))),
            ],
          ),
        ));
  }
}
