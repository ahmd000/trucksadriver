import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trucksadriver/Widget/bodys.dart';
import 'package:trucksadriver/halp/Color.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';
import 'package:trucksadriver/model/Futu.dart';
import 'package:trucksadriver/model/Orde.dart';
import 'package:trucksadriver/model/Order.dart';
import 'package:trucksadriver/page/Error.dart';

import '../GetX/GetXData.dart';
import '../GetX/GetXDriver.dart';
import '../GetX/GetXMarker.dart';
import '../halp/MapUtils.dart';
import 'ChatScreen.dart';
import 'Data.dart';
import 'Notifications/BankPage.dart';
import 'Notifications/NotificationsPage.dart';
import 'Personly/PersonlyPage.dart';
import 'Record/Record_Page.dart';
import 'Registration/Introduction.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var GetXdata = Get.put<GetXData>(GetXData());

  var getxdriver = Get.put<GetXDriver>(GetXDriver());
  var getxmarker = Get.put<GetXMarker>(GetXMarker());
  LocationData? _locationData;
  bool _serviceEnabled = false;
  Location location = new Location();
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  bool stute = false;

  Future<void> ints() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Get.snackbar(
        //     lan["Thereisaproblem"], lan["Menactivatethelocationfeature"],
        //     backgroundColor: Colors.white);
        Get.snackbar(
            lan["Thereisaproblem"]!, lan["Menactivatethelocationfeature"]!,
            backgroundColor: Colors.white);
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      // Get.defaultDialog(
      //     title: lan[""],
      //     // middleText: lan["Helpusprovideyouwithbetterqualityservice"],
      //     actions: [
      //       Builder(builder: (context) {
      //         var width = MediaQuery.of(context).size.width;
      //         var height = MediaQuery.of(context).size.height;
      //         return Container(
      //           child: Row(
      //             children: [
      //               Container(
      //                 width: width / 4,
      //                 color: Colors.black38,
      //                 child: Text("data"),
      //               )
      //             ],
      //           ),
      //         );
      //       })
      //     ]);

      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Get.snackbar(
        //     lan["Thereisaproblem"], lan["Menactivatethelocationfeature"],
        //     backgroundColor: Colors.white);
        Get.snackbar(
            lan["Thereisaproblem"]!, lan["Menactivatethelocationfeature"]!,
            backgroundColor: Colors.white);
        return;
      }
    }
    location.onLocationChanged.listen((event) {
      FutuDriver.Edtbylatandlong(
          getxdriver.data.id!, event.longitude!, event.longitude!);
    });
    stute = true;
    // _locationData = await location.getLocation();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getxdriver.geting(getxdriver.data.mobilenumber, getxdriver.data.password);
    getxmarker.GetMarkerfromorder();
    GetXdata.getorder(getxdriver.data.id!);
    ints();
    // GetXdata.getorderorderral(getxdriver.data.id!);
    // init();
  }

  // bool show = true;
  late double height;
  late double width;
  String filtr = "Ongoingrequests";

  // bool type=
  late GoogleMapController _Controller;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Bodys(
      back: false,

      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: btnborder,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(NotificationsPage());
                },
                child: Icon(
                  null,
                  // Icons.notifications,
                  color: btnborder,
                  size: height / 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Get.to(BankPage());
                },
                child: Icon(
                  Icons.card_membership,
                  color: btnborder,
                  size: height / 25,
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<GetXData>(
            init: GetXdata,
            builder: (_) {
              return GetXdata.orderreqwati.isNotEmpty
                  ? homewathgooglemap()
                  : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 22,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: btnborder2,
                            border: Border.all(color: btnborder2)),
                        child: DropdownButton<String>(
                          // value: filter,
                          icon: const Icon(null),
                          // elevation: 16,
                          // style: const TextStyle(color: Colors.deepPurple),
                          hint: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: 8.0, right: 8),
                              child: Text(lan[filtr]!, style: Text11),
                            ),
                            // color: Colors.deepPurpleAccent,
                          ),
                          underline: Container(),
                          onChanged: (String? newValue) {
                            setState(() {
                              filtr = newValue!;
                            });
                          },
                          borderRadius: BorderRadius.circular(10),
                          items: <String>[
                            'Ongoingrequests',
                            'Finished'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: btnborder2,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.black38)),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(lan[value]!, style: Text11),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    filtr == "Ongoingrequests"
                        ? Ongoingrequests()
                        : FinshOrder()
                  ],
                ),
              );
              // return homewathgooglemap();
            }),
      ),
    );
  }

  Widget Ongoingrequests() {
    return Container(
        height: height / 1.29,
        child: GetBuilder<GetXData>(
            init: GetXdata,
            builder: (context) {
              return RefreshIndicator(
                onRefresh: () {
                  if (!stute) ints();
                  return GetXdata.getorder(getxdriver.data.id!);
                },
                child: ListView.builder(
                    itemCount: !stute ? 0 : GetXdata.orderral.length,
                    itemBuilder: (context, index) {
                      Orde data = GetXdata.orderral[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: height / 4.2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width / 8,
                                          height: width / 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    "Asset/image/personicon.jpeg",
                                                  ))),
                                        ),
                                        Text(
                                          data.customers.name,
                                          style: Text1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding:
                                  //   const EdgeInsets
                                  //       .all(8.0),
                                  //   child:
                                  //   Container(),
                                  // ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await FutuOrder.setorders(
                                              getxdriver.data.id!, data.id, 3);
                                          GetXdata.getorder(
                                              getxdriver.data.id!);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: red,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.delete_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      InkWell(
                                        onTap: () async {
                                          // ;
                                          // return;
                                          var d = await FutuOrder.setorders(
                                              getxdriver.data.id!, data.id, 2);
                                          GetXdata.getorder(
                                              getxdriver.data.id!);
                                          if (!d["stest"]) {
                                            Get.defaultDialog(
                                                title: lan["anerroroccurred"]!,
                                                middleText: d["mesg"]);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Green,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.mode_standby_sharp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    Image.asset(
                                      "Asset/image/location-green.png",
                                      height: height / 30,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Container(
                                        width: width / 1.5,
                                        child: Text(
                                          // gexXUser.listOrder[index]
                                          //     .
                                          data.startLocationAddress,
                                          style: Text1.copyWith(
                                              fontSize: width / 21),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    Image.asset(
                                      "Asset/image/location-red.png",
                                      height: height / 30,
                                    ),
                                    SizedBox(
                                      width: width / 20,
                                    ),
                                    Container(
                                        width: width / 1.5,
                                        child: Text(
                                          // gexXUser.listOrder[index]
                                          //     .
                                          data.arriveLocationAddress,
                                          style: Text1.copyWith(
                                              fontSize: width / 21),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }));
  }

  Widget FinshOrder() {
    return Container(
      height: height / 1.29,
      child: ListView.builder(
          itemCount: getxdriver.data.orders.length,
          itemBuilder: (context, index) {
            String value = getxdriver.data.orders[index].id.toString();
            String data = value;
            if (value.length < 10) {
              value = "";
              for (int i = 0; i < 10; i++) {
                try {
                  value += data[i];
                } catch (e) {
                  value += "0";
                }
              }
            }
            // String id = "0000000000";
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: btnborder)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff7a90b),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              image: DecorationImage(
                                  image: AssetImage("Asset/image/invoke.png"))),
                          width: width / 7,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "#" + value,
                          style: Text1,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          getxdriver.data.orders[index].price,
                          style: Text1,
                        ),
                        SizedBox(width: 5),
                      ],
                    )
                  ],
                ),
                height: height / 13,
                width: width / 1.1,
              ),
            );
          }),
    );
  }

  Widget homewathgooglemap() {
    return GetBuilder<GetXData>(
        init: GetXdata,
        builder: (__) {
          return Container(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController _Controller) {
                    this._Controller = _Controller;
                  },
                  markers: Set<Marker>.of(GetXdata.orderreqwati.isEmpty
                      ? []
                      : [
                    Marker(
                        markerId: MarkerId(GetXdata
                            .orderreqwati[GetXdata.inde].id
                            .toString()),
                        position: LatLng(
                            GetXdata.orderreqwati[GetXdata.inde]
                                .startLocationLat,
                            GetXdata.orderreqwati[GetXdata.inde]
                                .startLocationLng))
                  ]),
                  initialCameraPosition: CameraPosition(
                      target: GetXdata.orderreqwati.isEmpty
                          ? LatLng(26.422548, 50.007610)
                          : LatLng(
                          GetXdata
                              .orderreqwati[GetXdata.inde].startLocationLat,
                          GetXdata.orderreqwati[GetXdata.inde]
                              .startLocationLng),
                      zoom: 13),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: height / 5,
                      width: width,
                      // color: Colors.black,
                      // GetXdata.getorderorderral(getxdriver.data.id!),

                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.85),
                          scrollDirection: Axis.horizontal,
                          itemCount: GetXdata.orderreqwati.length,
                          onPageChanged: (index) {
                            GetXdata.setindex(index);
                            CameraUpdate update = CameraUpdate.newLatLng(LatLng(
                                GetXdata.orderreqwati[index].startLocationLat,
                                GetXdata.orderreqwati[index].startLocationLng));
                            _Controller.animateCamera(update);
                          },
                          itemBuilder: (context, index) {
                            Orde data = GetXdata.orderreqwati[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // height: height / 4.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black54),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width / 8,
                                                height: width / 8,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          "Asset/image/personicon.jpeg",
                                                        ))),
                                              ),
                                              Text(
                                                data.customers.name,
                                                style: Text1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Padding(
                                        //   padding:
                                        //   const EdgeInsets
                                        //       .all(8.0),
                                        //   child:
                                        //   Container(),
                                        // ),
                                        // check_circle
                                        //
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // if (data.acase == "4") {
                                                //   var d = await FutuOrder
                                                //       .setCasetotootde(
                                                //           getxdriver.data.id!,
                                                //           data.id,
                                                //           8);
                                                //   GetXdata.getorder(
                                                //       getxdriver.data.id!);
                                                //   if (!d["stest"]) {
                                                //     Get.defaultDialog(
                                                //         title: lan[
                                                //             "anerroroccurred"]!,
                                                //         middleText: d["mesg"]);
                                                //   }
                                                // }
                                                // // MapUtils.openMap(
                                                // //     data.arriveLocationLat,
                                                // //     data.arriveLocationLng);
                                                Get.defaultDialog(
                                                    title: lan["Notes"]!,
                                                    middleText: data.message);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(6.0),
                                                  child: Icon(
                                                    Icons.info,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            data.acase == "2" ||
                                                data.acase == "3"
                                                ? InkWell(
                                              onTap: () async {
                                                // if ()
                                                await FutuOrder.cancelorde(
                                                    getxdriver.data.id!,
                                                    data.id,
                                                    data.rooms
                                                        .where((element) =>
                                                    element.stuteroom ==
                                                        true &&
                                                        element.drive_id ==
                                                            getxdriver
                                                                .data
                                                                .id!)
                                                        .first
                                                        .id);
                                                // print("......");
                                                GetXdata.getorder(
                                                    getxdriver.data.id!);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: red,
                                                    shape:
                                                    BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6.0),
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                                : data.acase == "4"
                                                ? InkWell(
                                              onTap: () async {
                                                if (data.acase ==
                                                    "4") {
                                                  var d = await FutuOrder
                                                      .setCasetotootde(
                                                      getxdriver
                                                          .data
                                                          .id!,
                                                      data.id,
                                                      8);
                                                  GetXdata.getorder(
                                                      getxdriver
                                                          .data.id!);
                                                  if (!d["stest"]) {
                                                    Get.defaultDialog(
                                                        title: lan[
                                                        "anerroroccurred"]!,
                                                        middleText: d[
                                                        "mesg"]);
                                                    return;
                                                  }
                                                  Get.defaultDialog(
                                                      title: lan[
                                                      "Tripcompleted"]!,
                                                      middleText: lan[
                                                      "Servicecosts"]! +
                                                          " " +
                                                          data.price,
                                                      actions: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                          children: [
                                                            InkWell(
                                                              onTap:
                                                                  () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child:
                                                              Container(
                                                                // width: width / 2.5,
                                                                child:
                                                                Text(
                                                                  lan["Okay"]!,
                                                                  style:
                                                                  Text1,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ]);
                                                }
                                                // MapUtils.openMap(
                                                //     data.arriveLocationLat,
                                                //     data.arriveLocationLng);
                                              },
                                              child: Container(
                                                decoration:
                                                BoxDecoration(
                                                    color: Green,
                                                    shape: BoxShape
                                                        .circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6.0),
                                                  child: Icon(
                                                    Icons
                                                        .check_circle,
                                                    color:
                                                    Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                                : Container(),
                                            SizedBox(width: 4),
                                            InkWell(
                                              onTap: () async {
                                                // ;
                                                // return;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(index)));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: btnborder,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(6.0),
                                                  child: Icon(
                                                    Icons.chat,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            InkWell(
                                              onTap: () async {
                                                // ;
                                                // return;
                                                data.acase == "2" ||
                                                    data.acase == "3"
                                                    ? MapUtils.openMap(
                                                    data.startLocationLat,
                                                    data.startLocationLng)
                                                    : MapUtils.openMap(
                                                    data.arriveLocationLat,
                                                    data.arriveLocationLng);
                                                // var d =
                                                // await FutuOrder.seto,
                                                //     rders(
                                                //     getxdriver.data.id!,
                                                //     data.id,
                                                //     2);
                                                // GetXdata.getorder(
                                                //     getxdriver.data.id!);
                                                // if (!d["stest"]) {
                                                //   Get.defaultDialog(
                                                //       title: lan[
                                                //       "anerroroccurred"]!,
                                                //       middleText: d["mesg"]);
                                                // }
                                                if (data.acase == "9") {
                                                  var d =
                                                  await FutuOrder.setorders(
                                                      getxdriver.data.id!,
                                                      data.id,
                                                      4);
                                                  GetXdata.getorder(
                                                      getxdriver.data.id!);
                                                  if (!d["stest"]) {
                                                    Get.defaultDialog(
                                                        title: lan[
                                                        "anerroroccurred"]!,
                                                        middleText: d["mesg"]);
                                                  }
                                                }
                                                MapUtils.openMap(
                                                    data.arriveLocationLat,
                                                    data.arriveLocationLng);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Green,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(6.0),
                                                  child: Icon(
                                                    Icons.map_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 25,
                                            ),
                                            Image.asset(
                                              "Asset/image/location-green.png",
                                              height: height / 30,
                                            ),
                                            SizedBox(
                                              width: width / 25,
                                            ),
                                            Container(
                                              // color: Colors.black,
                                                width: width / 1.75,
                                                child: Text(
                                                  // gexXUser.listOrder[index]
                                                  //     .
                                                  data.startLocationAddress,
                                                  style: Text1.copyWith(
                                                      fontSize: width / 21),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // print(data.acase );
                                                // return;
                                                if (data.acase == "2") {
                                                  var d = await FutuOrder
                                                      .setCasetotootde(
                                                      getxdriver.data.id!,
                                                      data.id,
                                                      3);
                                                  GetXdata.getorder(
                                                      getxdriver.data.id!);
                                                  if (!d["stest"]) {
                                                    Get.defaultDialog(
                                                        title: lan[
                                                        "anerroroccurred"]!,
                                                        middleText: d["mesg"]);
                                                  }
                                                }
                                                MapUtils.openMap(
                                                    data.startLocationLat,
                                                    data.startLocationLng);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: data.acase == "2"
                                                        ? Green
                                                        : Colors.grey,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(2.0),
                                                  child: Icon(
                                                    Icons.mode_standby_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 25,
                                            ),
                                            Image.asset(
                                              "Asset/image/location-red.png",
                                              height: height / 30,
                                            ),
                                            SizedBox(
                                              width: width / 25,
                                            ),
                                            Container(
                                              // color: Colors.black,
                                                width: width / 1.75,
                                                child: Text(
                                                  // gexXUser.listOrder[index]
                                                  //     .
                                                  data.arriveLocationAddress,
                                                  style: Text1.copyWith(
                                                      fontSize: width / 21),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                // ;
                                                // return;
                                                if (data.acase == "9") {
                                                  var d = await FutuOrder
                                                      .setCasetotootde(
                                                      getxdriver.data.id!,
                                                      data.id,
                                                      4);
                                                  GetXdata.getorder(
                                                      getxdriver.data.id!);
                                                  if (!d["stest"]) {
                                                    Get.defaultDialog(
                                                        title: lan[
                                                        "anerroroccurred"]!,
                                                        middleText: d["mesg"]);
                                                  }
                                                }
                                                if (data.acase == "3") {
                                                  var d = await FutuOrder
                                                      .setCasetotootde(
                                                      getxdriver.data.id!,
                                                      data.id,
                                                      9);
                                                  GetXdata.getorder(
                                                      getxdriver.data.id!);
                                                  if (!d["stest"]) {
                                                    Get.defaultDialog(
                                                        title: lan[
                                                        "anerroroccurred"]!,
                                                        middleText: d["mesg"]);
                                                  }
                                                }
                                                MapUtils.openMap(
                                                    data.arriveLocationLat,
                                                    data.arriveLocationLng);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: data.acase == "9" ||
                                                        data.acase == "3"
                                                        ? Green
                                                        : Colors.grey,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(2.0),
                                                  child: Icon(
                                                    Icons.mode_standby_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.start,
                                    //     children: [
                                    //       SizedBox(
                                    //         width: width / 15,
                                    //       ),
                                    //       Image.asset(
                                    //         "Asset/image/location-red.png",
                                    //         height: height / 30,
                                    //       ),
                                    //       SizedBox(
                                    //         width: width / 20,
                                    //       ),
                                    //       Container(
                                    //           width: width / 1.5,
                                    //           child: Text(
                                    //             // gexXUser.listOrder[index]
                                    //             //     .
                                    //             data.arriveLocationAddress,
                                    //             style: Text1.copyWith(
                                    //                 fontSize: width / 21),
                                    //             overflow:
                                    //                 TextOverflow.ellipsis,
                                    //           )),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )),
                // Positioned(
                //     bottom: 0,
                //     right: 0,
                //     left: 0,
                //     child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Column(
                //         children: [
                //           Container(
                //             height: height / 4.2,
                //             child: Stack(
                //               children: [
                //                 Positioned(
                //                   top: (width / 6) / 2,
                //                   left: 0,
                //                   right: 0,
                //                   bottom: 0,
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                         color: Colors.white,
                //                         border: Border.all(color: Colors.black54),
                //                         borderRadius: BorderRadius.circular(10)),
                //                     child: SingleChildScrollView(
                //                       child: Column(
                //                         children: [
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Padding(
                //                                 padding:
                //                                     const EdgeInsets.all(8.0),
                //                                 child: Container(),
                //                               ),
                //                               Padding(
                //                                 padding:
                //                                     const EdgeInsets.all(8.0),
                //                                 child: Container(),
                //                               ),
                //                               Padding(
                //                                 padding:
                //                                     const EdgeInsets.all(8.0),
                //                                 child: Container(
                //                                   decoration: BoxDecoration(
                //                                       color: btnborder,
                //                                       shape: BoxShape.circle),
                //                                   child: Padding(
                //                                     padding:
                //                                         const EdgeInsets.all(8.0),
                //                                     child: Icon(
                //                                       Icons.call,
                //                                       color: Colors.white,
                //                                     ),
                //                                   ),
                //                                 ),
                //                               )
                //                             ],
                //                           ),
                //                           SizedBox(
                //                             height: height / 80,
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.all(8.0),
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.start,
                //                               children: [
                //                                 SizedBox(
                //                                   width: width / 15,
                //                                 ),
                //                                 Image.asset(
                //                                   "Asset/image/location-green.png",
                //                                   height: height / 30,
                //                                 ),
                //                                 SizedBox(
                //                                   width: width / 20,
                //                                 ),
                //                                 Container(
                //                                     width: width / 1.5,
                //                                     child: Text(
                //                                       // gexXUser.listOrder[index]
                //                                       //     .
                //                                       "startLocationAddress",
                //                                       style: Text1.copyWith(
                //                                           fontSize: width / 21),
                //                                       overflow:
                //                                           TextOverflow.ellipsis,
                //                                     )),
                //                               ],
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding: const EdgeInsets.all(8.0),
                //                             child: Row(
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.start,
                //                               children: [
                //                                 SizedBox(
                //                                   width: width / 15,
                //                                 ),
                //                                 Image.asset(
                //                                   "Asset/image/location-red.png",
                //                                   height: height / 30,
                //                                 ),
                //                                 SizedBox(
                //                                   width: width / 20,
                //                                 ),
                //                                 Container(
                //                                     width: width / 1.5,
                //                                     child: Text(
                //                                       // gexXUser.listOrder[index]
                //                                       //     .
                //                                       "arriveLocationAddress",
                //                                       style: Text1.copyWith(
                //                                           fontSize: width / 21),
                //                                       overflow:
                //                                           TextOverflow.ellipsis,
                //                                     )),
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 Positioned(
                //                   top: 0,
                //                   left: 0,
                //                   right: 0,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Container(
                //                       child: Column(
                //                         children: [
                //                           Container(
                //                             width: width / 6,
                //                             height: width / 6,
                //                             decoration: BoxDecoration(
                //                                 shape: BoxShape.circle,
                //                                 image: DecorationImage(
                //                                     image: AssetImage(
                //                                   "Asset/image/personicon.jpeg",
                //                                 ))),
                //                           ),
                //                           Text(
                //                             lan["Personaldata"]!,
                //                             style: Text1,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Container(
                //                   width: width / 2.5,
                //                   alignment: Alignment.center,
                //                   decoration: BoxDecoration(
                //                       color: btnborder,
                //                       borderRadius: BorderRadius.circular(20)),
                //                   child: Text(
                //                     lan["Acceptance"]!,
                //                     style: Text1.copyWith(color: Colors.white),
                //                   ),
                //                 ),
                //                 Container(
                //                   width: width / 2.5,
                //                   alignment: Alignment.center,
                //                   decoration: BoxDecoration(
                //                       color: red,
                //                       borderRadius: BorderRadius.circular(20)),
                //                   child: Text(
                //                     lan["reject"]!,
                //                     style: Text1.copyWith(color: Colors.white),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     )),
              ],
            ),
          );
        });
  }

  Widget Drawer() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<GetXDriver>(
        init: getxdriver,
        builder: (_) {
          return Container(
            width: width / 1.5,
            height: height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height / 60,
                    ),
                    InkWell(
                      // onTap: () {
                      //   print(getxdriver.data.imageId.imagePage);
                      // },
                        child: Container(
                          height: width / 3.3,
                          width: width / 3.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: getxdriver.data.imageId.imagePage.isNotEmpty
                                ? DecorationImage(
                                fit: BoxFit.fill,
                                onError: (e, ee) {
                                  setState(() {
                                    // imagetype = true;
                                  });
                                },
                                image: (NetworkImage(
                                  getxdriver.data.imageId.imagePage,
                                )))
                                : DecorationImage(
                                fit: BoxFit.fill,
                                // onError: (e, ee) {
                                //   setState(() {
                                //     imagetype = true;
                                //   });
                                // },
                                image: (AssetImage(
                                    "Asset/image/personicon.jpeg"))),
                          ),
                        )),
                    Text(
                      getxdriver.data.name,
                      style: Text2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  height: height / 2,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => nav(index),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Icon(
                                  index == 0
                                      ? Icons.info_outline_rounded
                                      : index == 1
                                      ? Icons.policy
                                      : Icons.settings,
                                  color: btnborder2,
                                  size: height / 24,
                                ),
                              ),
                              Text(
                                lan[index == 0
                                    ? "Aboutapp"
                                    : index == 1
                                    ? "UsagePolicy"
                                    : "Settings"]!,
                                style: Text2.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      getxdriver.out();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => introduction()),
                            (route) => false,
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            "Asset/image/longout.jpeg",
                            height: height / 24,
                          ),
                        ),
                        Text(
                          lan["signout"]!,
                          style: Text2.copyWith(fontSize: 16, color: red),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void nav(int Index) {
    if (Index == 3)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => recordPage()));
    if (Index == 0)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataPageShow(
                  lan["Aboutapp"]!,
                  GetXdata.datap.data
                      .firstWhereOrNull(
                          (element) => element.paragraphnumber == "1")
                      ?.details)));
    if (Index == 1)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataPageShow(
                  lan["UsagePolicy"]!,
                  GetXdata.datap.data
                      .firstWhereOrNull(
                          (element) => element.paragraphnumber == "2")
                      ?.details)));
    if (Index == 2)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => personlyPage()));
  }

// void init() {}

// PopupMenuItem<String> item(String titel, Icon icon, {Function()? onTap}) =>
//     PopupMenuItem(
//       child: InkWell(
//         onTap: () {
//           onTap!();
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [Text(titel), icon],
//         ),
//       ),
//     );
}

class data {
  String? id;
  String title;
  Icon? icon;
  Function()? onTap;

  data({this.id, required this.title, this.icon, this.onTap});
}
