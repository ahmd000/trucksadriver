import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../halp/Color.dart';
import '../halp/TextStyle.dart';
import '../halp/lan.dart';
import 'home.dart';

class Erro extends StatelessWidget {
  LocationData? _locationData;
  bool _serviceEnabled = false;
  Location location = new Location();
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> ints(context) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Get.snackbar(
        //     lan["Thereisaproblem"], lan["Menactivatethelocationfeature"],
        //     backgroundColor: Colors.white);
        // Navigator.pop(context);
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
        // Navigator.pop(context);
        return;
      }
    }

    _locationData = await location.getLocation();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => homePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: btnborder,
          body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.blueGrey,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("Asset/image/Stylebec.jpeg"))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height / 4,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        // color: Colors.blueGrey,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage("Asset/image/reset_password.png"))),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    lan["anerroroccurred"]!,
                    style: Text1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Material(
                    color: Colors.white,
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      // color: Colros.,
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(color: Colors.)
                      //   ]
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          lan["Sitewarningmessage"]!,
                          textAlign: TextAlign.center,
                          style: Text1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {
                      ints(context);
                    },
                    child: Material(
                      color: btnborder,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // color: Colros.,
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(color: Colors.)
                        //   ]
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lan["Activatethesitenow"]!,
                            textAlign: TextAlign.center,
                            style: Text1.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container()
          ],
        ),
      )),
    );
  }
}
