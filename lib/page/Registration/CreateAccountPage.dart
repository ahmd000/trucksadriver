import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/halp/BoxDecoration.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';
import 'package:trucksadriver/page/Registration/sections.dart';

import '../../Widget/bodys.dart';
import '../../main.dart';

class CreateAccountPage extends StatelessWidget {
  TextEditingController controllerpassword = TextEditingController();

  TextEditingController controllerphone = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllername = TextEditingController();

  // var GetXUser = Get.put<GexXUser>(GexXUser());

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
                          child: Row(
                            children: [
                              Container(
                                width: width / 2,
                                height: height * 0.25,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "Asset/image/Stylebec.jpeg"))),
                        ),
                        Text(
                          lan["CreateAccount"]!,
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
                                controller: controllername,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: lan["name"],
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
                                controller: controllerEmail,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: lan["Email"],
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
                                keyboardType: TextInputType.visiblePassword,
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
                          if (controllerpassword.text.isEmpty ||
                              controllerphone.text.isEmpty ||
                              controllername.text.isEmpty ||
                              controllerEmail.text.isEmpty) {
                            Get.defaultDialog(
                                title: "",
                                middleText:
                                    lan["IncorrectLoginInformation"]!);

                            return;
                          }


                          Get.to(() => sections({
                                "name": controllername.text,
                                "mobilenumber": controllerphone.text,
                                "email": controllerEmail.text,
                                "password": controllerpassword.text,
                              }));
                        },
                        child: Container(
                          width: width,
                          height: height / 18,
                          alignment: Alignment.center,
                          decoration: BtnBluBD,
                          child: Text(lan["Productsselection"]!,
                              style: Text11),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
