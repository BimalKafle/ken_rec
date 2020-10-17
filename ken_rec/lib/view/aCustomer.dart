import 'package:flutter/material.dart';
import '../model/cCustomer.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final _formkey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlNumber = TextEditingController();
  Customer _customer = Customer();
  List<Customer> _customerlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          _form(),
          _listCustomer(),
        ],
      ),
    );
  }

  _form() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
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
                        controller: _ctrlName,
                        decoration: InputDecoration(
                          helperText: "Enter your name in above field",
                          icon: Icon(Icons.people),
                          labelText: "Full Name",
                        ),
                        onSaved: (val) => setState(() => _customer.name = val),
                        validator: (val) =>
                            (val.length == 0 ? "This field is reuired" : null),
                      ),
                      TextFormField(
                        controller: _ctrlNumber,
                        decoration: InputDecoration(
                          icon: Icon(Icons.contact_phone),
                          helperText: "Enter the Number in above field",
                          labelText: "Contact Number",
                        ),
                        onSaved: (val) =>
                            setState(() => _customer.number = val),
                        validator: (val) =>
                            (((val.length < 10) || (val.length > 10))
                                ? "Phone Number Must Contain atleast 10 numbers"
                                : null),
                      ),
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
  _listCustomer() => Container(
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  setState(() {
                    _customer = _customerlist[index];

                    _ctrlName.text = _customerlist[index].name;
                    _ctrlNumber.text = _customerlist[index].number;
                  });
                },
                trailing: IconButton(
                    icon: Icon(Icons.delete_sweep),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Remove Contact"),
                            content:
                                new Text("Are you sure you want to Delete"),
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
                leading: Icon(Icons.account_circle, size: 40.0),
                title: Text(_customerlist[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text(_customerlist[index].number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ));
            },
            itemCount: _customerlist.length,
          ),
        ),
      );
  _onSubmit() {
    var form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _customerlist.add(_customer);
      });
      _formReset();
    }
  }

  _formReset() {
    setState(() {
      _formkey.currentState.reset();
      _ctrlName.clear();
      _ctrlNumber.clear();
      _customer.id = null;
    });
  }
}
