import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../model/cLot.dart';
import '../main.dart';

class addLot extends StatefulWidget {
  @override
  _addLotState createState() => _addLotState();
}

class _addLotState extends State<addLot> {
  CLot _clot = CLot();
  final _formkey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(" Create a lot"),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/chicken.png'),
              ),
            ),
            _form(context),
          ],
        ),
      ),
    );
  }

  Positioned _form(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.blue.withOpacity(0.23),
              ),
            ]),
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TextFormField(
                  controller: _ctrlName,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: "Enter the Name of the Lot",
                    prefixIcon: Icon(Icons.book),
                  ),
                  onSaved: (val) => setState(() => _clot.name = val),
                  validator: (val) =>
                      (val.length == 0 ? "This field is required" : null),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blue,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        textColor: Colors.white,
                        child: Text("Cancel")),
                    RaisedButton(
                        onPressed: () {
                          _onSubmit();
                        },
                        elevation: 2,
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text("Save")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit() {
    var form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      String body = _ctrlName.text;

      _showNotification(body);
      print(body);
      _formReset();
    }
  }

  Future _showNotification(String body) async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel", "Ken_Rec", "Record exp and Income");
    var isoDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: isoDetails);
    await flutterLocalNotificationsPlugin.show(0, "Notification Bar",
        "New lot created with Name " + body, generalNotificationDetails);
  }

  _formReset() {
    setState(() {
      _formkey.currentState.reset();
      _ctrlName.clear();
      _clot.id = null;
    });
  }
}
