import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../GetX/GetXDriver.dart';
import '../../halp/Color.dart';
import '../../halp/TextStyle.dart';
import '../../halp/lan.dart';
import '../../main.dart';
import '../../model/Orde.dart';
import '../../model/Order.dart';

class ShowDataOrderPage extends StatefulWidget {
  int index;

  ShowDataOrderPage(this.index);

  @override
  _ShowDataOrderPageState createState() => _ShowDataOrderPageState();
}

class _ShowDataOrderPageState extends State<ShowDataOrderPage> {
  var data = Get.put<GetXDriver>(GetXDriver());
  List<Marker> Markers = [];

  Future<Marker> latLng(LatLng latLng, String markerId) async {
    // final Uint8List blankIcon =
    // await getBytesFromAsset('assets/blank_marker.png', 100);
    // var icon = await  BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(size: Size(5,5)),
    //     type?"Asset/image/location-green.png":"Asset/image/location-red.png",);
    return Marker(
      markerId: MarkerId(markerId),
      position: latLng,
      zIndex: 0,

      // icon: icon
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Markers1();
    Markers2();
  }

  Markers1() async {
    Markers.add(await latLng(
        LatLng(data.data.orders[widget.index].startLocationLat,
            data.data.orders[widget.index].startLocationLng),
        "1"));
    setState(() {
      Markers;
    });
  }

  Markers2() async {
    Markers.add(await latLng(
        LatLng(
          data.data.orders[widget.index].arriveLocationLat,
          data.data.orders[widget.index].arriveLocationLng,
        ),
        "2"));
    setState(() {
      Markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
          textDirection: settings.lanDirection,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  lan["ContinueOrder"]!,
                  style: Text1,
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        // bool status = await fuataOrder.deleteOrder(
                        //     data.listOrder[widget.index].id, "ar");
                        // print(status);
                        // if (!status) return;
                        // Navigator.pop(context, true);
                        // Get.defaultDialog(
                        //     title: "",
                        //     middleText: lan["TheRequestHasDeenDeleted"]);
                      },
                      child: Icon(
                        Icons.delete,
                        color: red,
                      ),
                    ),
                  )
                ],
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: () async {
                    Navigator.pop(context, false);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                  ),
                ),
              ),
              body: GetBuilder<GetXDriver>(
                  init: data,
                  builder: (_) {
                    Orde odata = data.data.orders[widget.index];
                    return Column(
                      children: [
                        Container(
                          width: width,
                          height: height / 1.67,
                          child: GoogleMap(
                            markers: Set.of(Markers),
                            initialCameraPosition: CameraPosition(
                              zoom: 20,
                              target: LatLng(odata.startLocationLat,
                                  odata.startLocationLng),
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.black26,
                          width: width,
                          height: height / 4.1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lan["TripPrice"]!,
                                      style: Text1,
                                    ),
                                    Text(
                                      "${odata.price} SAR",
                                      style: Text1.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.black),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 50,
                                    ),
                                    Image.asset(
                                      "Asset/image/location-green.png",
                                      height: height / 30,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Container(
                                        width: width / 1.2,
                                        child: Text(
                                          odata.startLocationAddress,
                                          style: Text1.copyWith(
                                              fontSize: width / 21),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: width / 50,
                                    ),
                                    Image.asset(
                                      "Asset/image/location-red.png",
                                      height: height / 30,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Container(
                                        width: width / 1.2,
                                        child: Text(
                                          odata.arriveLocationAddress,
                                          style: Text1.copyWith(
                                              fontSize: width / 21),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }))),
    );
  }
}
