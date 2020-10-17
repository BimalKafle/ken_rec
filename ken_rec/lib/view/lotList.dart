import 'package:flutter/material.dart';

import 'itmView.dart';

class lotList extends StatefulWidget {
  @override
  _lotListState createState() => _lotListState();
}

class _lotListState extends State<lotList> {
  List<String> name = ['Bimal', 'Shyam', 'Bishal', 'kishor', 'Kumar'];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  elevation: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    title: Text(name[index]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemView(),
                        settings: RouteSettings(
                          arguments: name[index],
                        ),
                      ));
                    },
                    subtitle: Text("Lot Number"),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onPressed: () {}),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
