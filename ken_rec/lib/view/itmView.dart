import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'itemList.dart';
import 'aCustomer.dart';

class ItemView extends StatefulWidget {
  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ItmList(),
          bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.blueAccent,
                  ),
                  tooltip: "Go to home page",
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddCustomer()));
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.orange,
                  ),
                  tooltip: "Add Customer",
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.moneyBill,
                    color: Colors.green,
                  ),
                  tooltip: "Add Income",
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.book,
                    color: Colors.red,
                  ),
                  tooltip: "Add Expenses",
                ),
              ],
            ),
          )),
    );
  }
}
