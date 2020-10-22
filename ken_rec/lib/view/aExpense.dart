import 'package:flutter/material.dart';
import 'package:ken_rec/model/cExpense.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formkey = GlobalKey<FormState>();
  final _ctrlItem = TextEditingController();
  final _ctrlRate = TextEditingController();
  final _ctrlQty = TextEditingController();
  final _controller = ScrollController();
  Expense _expense = Expense();
  List<Expense> _explist = [];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.blue.withOpacity(0.23),
                    ),
                  ],
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: ExpansionCard(
                  trailing: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 0, left: 15),
                  title: Text(
                    "Add Expenses",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  children: [
                    _form(),
                  ],
                ),
              ),
            ),
          ),
          _listExpense(),
        ],
      ),
    );
  }

  _form() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
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
                        icon: Icon(
                          Icons.arrow_right,
                        ),
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
      );
//on submit for the form
  _onSubmit() {
    var form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _expense.total = int.parse(_ctrlQty.text) * int.parse(_ctrlRate.text);
        _explist.add(_expense);
      });
      _formReset();
    }
  }

  //to reset the form
  _formReset() {
    setState(() {
      _formkey.currentState.reset();
      _ctrlItem.clear();
      _ctrlQty.clear();
      _ctrlRate.clear();
      _expense.id = null;
    });
  }

  //list for the data
  _listExpense() => Container(
        child: Expanded(
          child: FadingEdgeScrollView.fromScrollView(
            child: ListView.builder(
              controller: _controller,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Card(
                    elevation: 10,
                    child: ListTile(
                      isThreeLine: true,
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                            ),
                            onPressed: () {
                              setState(() {
                                _expense = _explist[index];

                                _ctrlItem.text = _explist[index].item;
                                _ctrlQty.text =
                                    _explist[index].quantity.toString();
                                _ctrlRate.text =
                                    _explist[index].rate.toString();
                              });
                            },
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete_sweep,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return AlertDialog(
                                      title: new Text("Remove Contact"),
                                      content: new Text(
                                          "Are you sure you want to Delete"),
                                      actions: <Widget>[
                                        // usually buttons at the bottom of the dialog
                                        new FlatButton(
                                          child: new Text("Ok"),
                                          onPressed: () async {},
                                        ),
                                        new FlatButton(
                                          child: new Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ],
                      ),
                      leading:
                          Icon(Icons.local_grocery_store_rounded, size: 40.0),
                      title: Row(
                        children: [
                          Text(_explist[index].item,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Qty :" + _explist[index].quantity.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Rate : Rs. " + _explist[index].rate.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                              "Total : Rs. " + _explist[index].total.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ));
              },
              itemCount: _explist.length,
            ),
          ),
        ),
      );
}
