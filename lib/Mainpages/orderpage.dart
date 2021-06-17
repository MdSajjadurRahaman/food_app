import 'package:flutter/material.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';

class Orderpage extends StatefulWidget {
  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appbartab(context, strTitle: "My Orders"),
          body: TabBarView(children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: order.length == 0
                  ? Center(child: Text("No order available"))
                  : ongoing(),
            ),
            Center(
              child: history(),
            )
          ]),
        ));
  }
}

history() {
  return Text("No history available");
}

ongoing() {
  print(order.length);
  return ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemCount: order.length,
    itemBuilder: (BuildContext context, int index) {
      String status;
      Color color;

      if (order[index].status == 0) {
        status = "Preparing";
        color = Colors.green;
      } else if (order[index].status == 1) {
        status = "Delivering";
        color = Colors.blue;
      } else if (order[index].status == 2) {
        status = "Delivered";
        color = Colors.orangeAccent;
      } else {
        status = "Canceled";
        color = Colors.red;
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            trailing: Icon(Icons.fiber_manual_record, color: color),
            title: Text(order[index].time.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black)),
            subtitle: Text(status + " - " + order[index].location,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black)),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      );
    },
  );
}
