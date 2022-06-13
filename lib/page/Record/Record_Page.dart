import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';

import '../../main.dart';
import 'LogTracking_page.dart';

class recordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var gexXUser = Get.put<GexXUser>(GexXUser());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Directionality(
            textDirection: settings.lanDirection,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    lan["records"]!,
                    style: Text1,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black54,
                    ),
                  ),
                ),body: Container(),
                // body: GetBuilder<GexXUser>(
                //   init: gexXUser,
                //   builder: (_) {
                //     return Container(
                //       height: height,
                //       width: width,
                //       child: RefreshIndicator(
                //         onRefresh: () async => gexXUser.getorder(),
                //         child: ListView.builder(
                //             itemCount: gexXUser.listOrder.length,
                //             itemBuilder: (context, index) {
                //               return Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: InkWell(
                //                   onTap: () async {
                //                     var datareturn = await Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 logTrackingPage(index)));
                //                     if (datareturn == null||!datareturn) return;
                //                     gexXUser.getorder();
                //                   },
                //                   child: Container(
                //                     width: width,
                //                     height: height / 5,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(5),
                //                         color: Colors.white,
                //                         boxShadow: [
                //                           BoxShadow(
                //                               color: Colors.black26,
                //                               blurRadius: 2,
                //                               spreadRadius: 2)
                //                         ]),
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text(
                //                                 gexXUser.listOrder[index].date
                //                                     .toString()
                //                                     .split(" ")[0],
                //                                 style: Text1,
                //                               ),
                //                               Text(
                //                                 "${gexXUser.listOrder[index].price} SAR",
                //                                 style: Text1.copyWith(
                //                                     fontWeight:
                //                                         FontWeight.bold),
                //                               ),
                //                             ],
                //                           ),
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.end,
                //                             children: [
                //                               SizedBox(
                //                                 width: width / 25,
                //                               ),
                //                               Image.asset(
                //                                 "Asset/image/location-green.png",
                //                                 height: height / 30,
                //                               ),
                //                               SizedBox(
                //                                 width: width / 20,
                //                               ),
                //                               Container(
                //                                   width: width / 1.33,
                //                                   child: Text(
                //                                     gexXUser.listOrder[index]
                //                                         .startLocationAddress,
                //                                     style: Text1.copyWith(
                //                                         fontSize: width / 21),
                //                                     overflow:
                //                                         TextOverflow.ellipsis,
                //                                   )),
                //                             ],
                //                           ),
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.end,
                //                             children: [
                //                               SizedBox(
                //                                 width: width / 15,
                //                               ),
                //                               Image.asset(
                //                                 "Asset/image/location-red.png",
                //                                 height: height / 30,
                //                               ),
                //                               SizedBox(
                //                                 width: width / 20,
                //                               ),
                //                               Container(
                //                                   width: width / 1.33,
                //                                   child: Text(
                //                                     gexXUser.listOrder[index]
                //                                         .arriveLocationAddress,
                //                                     style: Text1.copyWith(
                //                                         fontSize: width / 21),
                //                                     overflow:
                //                                         TextOverflow.ellipsis,
                //                                   )),
                //                             ],
                //                           ),
                //                           Container(
                //                               width: width,
                //                               child: Text(
                //                                 gexXUser
                //                                     .listOrder[index].status,
                //                                 style: Text1.copyWith(
                //                                     fontSize: width / 22,
                //                                     color: Green),
                //                               )),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             }),
                //       ),
                //     );
                //   },
                // )
            )
        ));
  }
}
