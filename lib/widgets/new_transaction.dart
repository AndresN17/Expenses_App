import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    String newTitle = titleController.text;
    double newAmount = double.parse(amountController.text);
    if (newTitle.isEmpty || newAmount <= 0) {
      return;
    }
    widget.addTransaction(newTitle, newAmount);
    Navigator.of(context).pop();
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
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text('No Date Chosen'),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Chose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  onPressed: submitData,
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text(
                    'Add Transaction',
                  )),
            ],
          ),
        ));
  }
}
