import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/GetX/GetXDriver.dart';
import 'package:trucksadriver/Widget/bodys.dart';
import 'package:trucksadriver/halp/BoxDecoration.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';
import 'package:trucksadriver/model/Driver.dart';
import 'package:trucksadriver/model/Futu.dart';
import 'package:trucksadriver/model/Truns.dart';

import '../../main.dart';
import '../home.dart';

class LoginPage extends StatelessWidget {
  var getxDriver = Get.put<GetXDriver>(GetXDriver());
  TextEditingController controllerpassword = TextEditingController();

  TextEditingController controllerphone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Bodys(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: height / 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "Asset/image/Stylebec.jpeg"))),
                      ),
                      Text(
                        lan["Login"]!,
                        style: Text2,
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                      Text(
                        lan["Pleaseenteraccountinformationcorrect"]!,
                        style: Text0,
                      ),
                      SizedBox(
                        height: height / 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            width: width,
                            height: height / 17,
                            alignment: Alignment.center,
                            decoration: inputBD,
                            child: TextField(
                              controller: controllerphone,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: lan["phone"],
                                helperStyle:
                                Text1.copyWith(color: Colors.black38),
                                border: InputBorder.none,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            width: width,
                            height: height / 17,
                            alignment: Alignment.center,
                            decoration: inputBD,
                            child: TextField(
                              controller: controllerpassword,
                              textAlign: TextAlign.center,
                              // keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: lan["password"],
                                helperStyle:
                                Text1.copyWith(color: Colors.black38),
                                border: InputBorder.none,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: [],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () async {
                        Map<String, dynamic> y = {};

                        if (controllerpassword.text.isEmpty ||
                            controllerphone.text.isEmpty) {
                          Get.defaultDialog(
                              title: "",
                              middleText:
                              lan["IncorrectLoginInformation"]!);

                          return;
                        }

                        var rest = await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              Future<void> Longin() async {
                                Truns Data = (await FutuDriver.Longin(
                                    controllerphone.text,
                                    controllerpassword.text));
                                // if (Data.stest)
                                //   getxDriver.up(Data.data as Driver);
                                getxDriver.setmaponlocaldatastorg(
                                    Data.data.toEJson());
                                // print(await getxDriver.getdatafromlocalstorg());

                                Navigator.pop(context, Data.stest);
                              }

                              Longin();

                              return WillPopScope(
                                onWillPop: () async {
                                  debugPrint("Will pop");
                                  return false;
                                },
                                child: Center(
                                    child: CircularProgressIndicator()),
                              );
                            });
                        // return;
                        if (rest == null || !(rest as bool)) return;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homePage()),
                              (route) => false,
                        );
                      },
                      child: Container(
                        width: width,
                        height: height / 18,
                        alignment: Alignment.center,
                        decoration: BtnBluBD,
                        child: Text(lan["Login"]!, style: Text11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
