import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    String newTitle = titleController.text;
    double newAmount = double.parse(amountController.text);
    if (newTitle.isEmpty || newAmount <= 0) {
      return;
    }
    widget.addTransaction(newTitle, newAmount);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                    Expanded(
                        child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    )),
                    FlatButton(
                      onPressed: _presentDatePicker,
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
