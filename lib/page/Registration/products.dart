import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/model/Futu.dart';
import '../../GetX/GetXData.dart';
import '../../GetX/GetXDriver.dart';
import '../../halp/TextStyle.dart';
import '../../halp/lan.dart';
import '../../main.dart';
import '../../model/Truns.dart';
import '../home.dart';

class products extends StatefulWidget {
  int index;
  Map<String, dynamic> data;

  // Map<String, dynamic> data = {};

  products(this.index, this.data);

  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {
  var GetXCAtegories = Get.put<GetXData>(GetXData());
  var getxdriver = Get.put<GetXDriver>(GetXDriver());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Directionality(
            textDirection: settings.lanDirection,
            child: Scaffold(
                // appBar: AppBar(
                //   title: Text(
                //     lan["Choosetrucks"]!,
                //     style: Text1,
                //   ),
                //   centerTitle: true,
                //   backgroundColor: Colors.white,
                //   leading: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       color: Colors.black54,
                //     ),
                //   ),
                // ),
                body: Container(
              height: height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width / 1.1,
                      height: height / 20,
                      child: PhysicalModel(
                          color: Colors.white,
                          elevation: 4,
                          shadowColor: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(lan["Choosetrucks"]!,
                                textAlign: TextAlign.center, style: Text1),
                          )),
                    ),
                  ),
                  Container(
                    height: height / 1.2,
                    child: RefreshIndicator(
                      onRefresh: () async => await GetXCAtegories.getdata(),
                      child: ListView.builder(
                          itemCount: GetXCAtegories
                              .data.data[widget.index].product.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) {
                                        Future<void> muthod() async {
                                          // print( GetXCAtegories
                                          //     .data
                                          //     .data[widget.index]
                                          //     .product[index]
                                          //     .product.id);
                                          // return;
                                          widget.data.addAll({
                                            "driverProducts": [
                                              GetXCAtegories
                                                  .data
                                                  .data[widget.index]
                                                  .product[index]
                                                  .product.id
                                            ]
                                          });
                                          Truns d = (await FutuDriver.addDriver(
                                              widget.data));
                                          // print(d.mesg);

                                          if (!d.stest) {
                                            Navigator.pop(context);
                                            Get.defaultDialog(
                                                title: lan[
                                                    "IncorrectLoginInformation"]!,
                                                middleText: d.mesg);
                                            return;
                                          }
                                          getxdriver.up(d.data);
                                          // return;
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    homePage()),
                                            (route) => false,
                                          );
                                        }

                                        muthod();
                                        return WillPopScope(
                                          onWillPop: () async {
                                            debugPrint("Will pop");
                                            return true;
                                          },
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      });
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: width / 5,
                                          height: width / 5,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: NetworkImage(
                                                    GetXCAtegories
                                                        .data
                                                        .data[widget.index]
                                                        .product[index]
                                                        .product
                                                        .imageProduct
                                                        .imagePage)),
                                          ),
                                        ),
                                        Container(
                                            width: width / 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(13.0),
                                              child: Text(
                                                "${GetXCAtegories.data.data[widget.index].product[index].product.names}",
                                                style: Text1.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      width: width / 4,
                                      child: Text(
                                        "${GetXCAtegories.data.data[widget.index].product[index].product.price} - ${GetXCAtegories.data.data[widget.index].maximumPrice}" +
                                            "  " +
                                            "ريال",
                                        style: Text1.copyWith(fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ))));
  }
}
