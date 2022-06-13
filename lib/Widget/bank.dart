import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GetX/GetXDriver.dart';
import '../halp/TextStyle.dart';
import '../halp/lan.dart';
import '../model/Futu.dart';

class bankadd extends StatelessWidget {
  TextEditingController Convertername = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController statement = TextEditingController();
  TextEditingController Bankname = TextEditingController();
  var getxdriver = Get.put<GetXDriver>(GetXDriver());

  update() {
    if (Bankname.text.isEmpty ||
        cardnumber.text.isEmpty ||
        statement.text.isEmpty ||
        Convertername.text.isEmpty) return;
    Map<String, dynamic> data = {
      "drive_id": getxdriver.data.id!,
      "beneficiaryName": Convertername.text,
      "bankname": Bankname.text,
      "accountnumber": cardnumber.text,
      "ibannumber": statement.text,
    };
    FutuDriver.addbank(data);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          bottom: height / 10,
          top: height / 10,
          left: width / 10,
          right: width / 10),
      child: Container(
        child: PhysicalModel(
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              // backgroundColor: Colors.black,
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(lan["cards"]!, style: Text1),
                          ],
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Container(
                          height: height / 20,
                          child: PhysicalModel(
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextField(
                                  controller: Convertername,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["Convertername"]!,
                                      // border: InputBorder.none(),
                                      border: InputBorder.none),
                                ),
                              ))),
                      SizedBox(height: height / 30),
                      Container(
                          height: height / 20,
                          child: PhysicalModel(
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextField(
                                  controller: statement,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["statement"]!,
                                      // border: InputBorder.none(),
                                      border: InputBorder.none),
                                ),
                              ))),
                      SizedBox(height: height / 30),
                      Container(
                          height: height / 20,
                          child: PhysicalModel(
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextField(
                                  controller: cardnumber,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["cardnumber"]!,
                                      // border: InputBorder.none(),
                                      border: InputBorder.none),
                                ),
                              ))),
                      SizedBox(height: height / 30),
                      Container(
                          height: height / 20,
                          child: PhysicalModel(
                              color: Colors.white,
                              elevation: 4,
                              shadowColor: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextField(
                                  controller: Bankname,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["Bankname"]!,
                                      // border: InputBorder.none(),
                                      border: InputBorder.none),
                                ),
                              ))),
                      SizedBox(height: height / 30),
                      InkWell(
                        onTap: () => update(),
                        child: Container(
                            height: height / 20,
                            width: width / 2,
                            child: Container(
                              child: PhysicalModel(
                                  color: Colors.white,
                                  elevation: 4,
                                  shadowColor: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(lan["addbank"]!,
                                        style: Text1,
                                        textAlign: TextAlign.center),
                                  )),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
