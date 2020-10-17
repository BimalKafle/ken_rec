import 'package:flutter/material.dart';
import 'searchHeader.dart';
import 'lotList.dart';

class bodypg extends StatefulWidget {
  @override
  _bodypgState createState() => _bodypgState();
}

class _bodypgState extends State<bodypg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SearchHeader(size: size),
        SizedBox(
          height: 20.0,
        ),
        lotList(),
      ],
    );
  }
}
