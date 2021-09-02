import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/widgets/globalWidget.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/sampledata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class DeliveryDetails extends StatefulWidget {
  String orderId;
  int index;
  DeliveryDetails({required this.orderId, required this.index});
  @override
  _DeliveryDetailsState createState() =>
      _DeliveryDetailsState(orderId: orderId, index: index);
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  String orderId;
  int index;
  _DeliveryDetailsState({required this.orderId, required this.index});

  String status = "";
  String formattedDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (order[index].status == 0) {
      status = "Preparing";
    } else if (order[index].status == 1) {
      status = "Cooking";
    } else if (order[index].status == 2) {
      status = "Waiting for Driver";
    } else if (order[index].status == 3) {
      status = "Delivering";
    } else if (order[index].status == 4) {
      status = "Delivered";
    } else {
      status = "Canceled";
    }
    formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2(context,
          strTitle: "Ongoing Order",
          disappearedBackButton: false,
          row: status == "Delivering" ? getMockUpdate() : Row()),
      body: Container(
        color: Theme.of(context).accentColor,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 300),
        child: status == "Delivering"
            ? FlutterMap(
                options: MapOptions(
                  bounds: LatLngBounds(
                      latLng.LatLng(3.124784719860101, 101.71059356679119),
                      latLng.LatLng(3.1277843231389104, 101.71431647290397)),
                  boundsOptions:
                      FitBoundsOptions(padding: EdgeInsets.all(90.0)),
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 20.0,
                        height: 20.0,
                        point: latLng.LatLng(
                            3.124784719860101, 101.71059356679119),
                        builder: (ctx) => Container(
                          child: Icon(
                            FontAwesomeIcons.mapMarker,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Marker(
                        width: 20.0,
                        height: 20.0,
                        point: latLng.LatLng(
                            3.1277843231389104, 101.71431647290397),
                        builder: (ctx) => Container(
                          child: Icon(
                            FontAwesomeIcons.mapMarker,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : nonMapsWidget(),
      ),
      bottomSheet: bottomDetails(),
    );
  }

  nonMapsWidget() {
    return Container(
      alignment: Alignment.center,
      child: order[index].status == 2
          ? iconWithText(
              FontAwesomeIcons.cloudMeatball, "Wating for pick up", true)
          : iconWithText(FontAwesomeIcons.checkCircle, "Order Delivered", true),
    );
  }

  Row getMockUpdate() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                order[order.indexWhere(
                        (element) => element.orderId == order[index].orderId)]
                    .status = 4;
                status = "Delivered";
              });
            },
            icon: Icon(Icons.refresh))
      ],
    );
  }

  bottomDetails() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.clock,
                size: 20,
                color: Colors.black45,
              ),
              Text(
                formattedDate.toString(),
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Icon(
                  FontAwesomeIcons.solidUserCircle,
                  color: Theme.of(context).accentColor,
                  size: 30,
                ),
              ),
              title: Text(
                order[index].customerEmail,
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              subtitle: Text(
                order[index].location,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              trailing: Wrap(
                direction: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child:
                          iconButton(FontAwesomeIcons.phone, () {}, size: 20)),
                  GestureDetector(
                      onTap: () {},
                      child: iconButton(FontAwesomeIcons.locationArrow, () {},
                          size: 20)),
                ],
              )),
          button(order[index].status == 2 ? "Picked Up" : status, () {
            if (order[index].status == 2) {
              setState(() {
                order[order.indexWhere(
                        (element) => element.orderId == order[index].orderId)]
                    .status = 3;
                status = "Delivering";
              });
            }
          },
              order[index].status == 2
                  ? Theme.of(context).accentColor
                  : Colors.black45,
              Colors.white,
              height: 50,
              rounded: true),
          SizedBox(
            height: 5,
          ),
          Divider(thickness: 5, color: Colors.black12),
          Text(
            "Next",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }

  nextQueue() {
    return Expanded(
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (BuildContext context, int index) {
          String formattedDate =
              DateFormat('EEEE, dd MMMM yyyy').format(order[index].time);
          if (order[index].status == 2) {
            return GestureDetector(
              onTap: () async {
                final success = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return DeliveryDetails(
                    orderId: order[index].orderId,
                    index: index,
                  );
                }));
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: HexColor("#F0F0F0"),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            FontAwesomeIcons.solidUserCircle,
                            color: Theme.of(context).accentColor,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          order[index].customerEmail,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Text(
                          order[index].location,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                        )),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.clock,
                          size: 18,
                        ),
                        Text(
                          formattedDate.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
