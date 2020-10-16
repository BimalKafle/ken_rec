import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class ItmList extends StatefulWidget {
  @override
  _ItmListState createState() => _ItmListState();
}

class _ItmListState extends State<ItmList> {
  NepaliDateTime nDate = NepaliDateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text:
                              NepaliDateFormat.EEEE().format(nDate).toString() +
                                  ' | ',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              NepaliDateFormat.MMMd().format(nDate).toString() +
                                  '\n',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: nDate.year.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                color: Color.fromRGBO(124, 169, 201, 0.9),
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: Image(
                        image: AssetImage('assets/cFrame.jpg'),
                      )),
                ),
                Positioned(
                  left: 0,
                  top: 70,
                  right: 70,
                  child: Column(
                    children: [
                      Text(
                        "Click Here!!",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          print("Hello");
                        },
                        child: Text("Click Me!!"),
                      ),
                      Text("See the Record"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
