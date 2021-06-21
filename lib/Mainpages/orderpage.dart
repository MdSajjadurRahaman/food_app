import 'package:flutter/material.dart';
import 'package:food_app/Secondarypages/orderdetails.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';
import 'package:intl/intl.dart';

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
            Center(
              child: order.length == 0
                  ? Center(child: Text("No order available"))
                  : ongoing(context),
            ),
            Center(
              child: order.length == 0
                  ? Text("No order available")
                  : history(context),
            )
          ]),
        ));
  }
}

history(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: order.length,
      itemBuilder: (BuildContext context, int index) {
        String status;
        Color color;

        if (order[index].status == 0) {
          status = "Preparing";
          color = Colors.orangeAccent;
        } else if (order[index].status == 1) {
          status = "Delivering";
          color = Colors.blue;
        } else if (order[index].status == 2) {
          status = "Delivered";
          color = Colors.green;
        } else {
          status = "Canceled";
          color = Colors.red;
        }

        String formattedDate =
            DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);

        if (order[index].status >= 2) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderDetails(
                          orderId: order[index].orderId,
                        )),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  trailing: Icon(Icons.fiber_manual_record, color: color),
                  title: Text(formattedDate.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black)),
                  subtitle: Text(status + " - " + order[index].location,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black)),
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    ),
  );
}

ongoing(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: order.length,
      itemBuilder: (BuildContext context, int index) {
        String status;
        Color color;

        if (order[index].status == 0) {
          status = "Preparing";
          color = Colors.orangeAccent;
        } else if (order[index].status == 1) {
          status = "Delivering";
          color = Colors.blue;
        } else if (order[index].status == 2) {
          status = "Delivered";
          color = Colors.green;
        } else {
          status = "Canceled";
          color = Colors.red;
        }

        String formattedDate =
            DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);

        if (order[index].status < 2) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderDetails(
                          orderId: order[index].orderId,
                        )),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  trailing: Icon(Icons.fiber_manual_record, color: color),
                  title: Text(formattedDate.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black)),
                  subtitle: Text(status + " - " + order[index].location,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black)),
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    ),
  );
}
