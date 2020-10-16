import 'package:flutter/material.dart';
import 'bodypg.dart';
import 'lotForm.dart';

class HomePg extends StatefulWidget {
  @override
  _HomePgState createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: bodypg(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => addLot()))
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(height: 50.0),
          elevation: 2,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
