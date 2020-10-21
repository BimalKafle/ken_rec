import 'package:flutter/material.dart';
import 'package:ken_rec/model/cExpense.dart';
import 'package:expansion_card/expansion_card.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formkey = GlobalKey<FormState>();
  final _ctrlItem = TextEditingController();
  final _ctrlRate = TextEditingController();
  final _ctrlQty = TextEditingController();
  Expense _expense = Expense();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                width: MediaQuery.of(context).size.width,
                child: ExpansionCard(
                  title: Text(
                    "Add Expenses",
                    style: TextStyle(color: Colors.red),
                  ),
                  children: [
                    _form(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _form() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _ctrlItem,
                        decoration: InputDecoration(
                          helperText: "Enter item name in above field",
                          icon: Icon(Icons.arrow_right),
                          labelText: "Item Purchased",
                        ),
                        onSaved: (val) => setState(() => _expense.item = val),
                        validator: (val) =>
                            (val.length == 0 ? "This field is reuired" : null),
                      ),
                      TextFormField(
                        controller: _ctrlQty,
                        decoration: InputDecoration(
                          icon: Icon(Icons.arrow_right),
                          helperText: "Number of Quantity",
                          labelText: "Quantity",
                        ),
                        onSaved: (val) =>
                            setState(() => _expense.quantity = int.parse(val)),
                        validator: (val) =>
                            (val.length == 0 ? "This field is reuired" : null),
                      ),
                      TextFormField(
                        controller: _ctrlRate,
                        decoration: InputDecoration(
                          icon: Icon(Icons.arrow_right, size: 40),
                          helperText: "Enter the price rate in above field",
                          labelText: "Rate(Nrs.)",
                        ),
                        onSaved: (val) =>
                            setState(() => _expense.rate = int.parse(val)),
                        validator: (val) =>
                            (val.length == 0 ? "This field is reuired" : null),
                      ),
                      Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_today_rounded),
                            label: Text("Choose Date"),
                            color: Colors.blue[300],
                            textColor: Colors.white,
                          ),
                        ),
                        Text("Date is"),
                      ]),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            _onSubmit();
                          },
                          child: Text("Submit"),
                          color: Colors.blue[300],
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  _onSubmit() => null;
}
