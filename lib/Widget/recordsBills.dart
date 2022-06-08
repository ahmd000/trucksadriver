import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../GetX/GetXDriver.dart';
import '../halp/TextStyle.dart';
import '../halp/lan.dart';
import '../model/Futu.dart';

class recordsBills extends StatefulWidget {
  int bills_id;

  @override
  _recordsBillsState createState() => _recordsBillsState();

  recordsBills(this.bills_id);
}

class _recordsBillsState extends State<recordsBills> {
  TextEditingController non = TextEditingController();
  TextEditingController price = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? data;

  update() async {
    if (price.text.isEmpty) return;
    Map<String, dynamic> data = {
      "bills_id": widget.bills_id,
      "non": non.text,
      "price": price.text
    };
    int id = await FutuDriver.addBills(data);
    if (id!=0 && this.data != null)
      FutuDriver.addimageBills(id, this.data!.path);
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
                      InkWell(
                        onTap: () => getimge(),
                        child: Container(
                            height: height / 5,
                            width: width,
                            // decoration: data == null
                            //     ? BoxDecoration()
                            //     : BoxDecoration(
                            //         image: DecorationImage(
                            //             image: FileImage())),
                            child: PhysicalModel(
                                color: Colors.white,
                                elevation: 4,
                                shadowColor: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: data != null
                                      ? SingleChildScrollView(
                                          child: Image.file(
                                            data!,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : Container(
                                          child: Icon(
                                              data != null ? null : Icons.add,
                                              size: width / 5),
                                        ),
                                ))),
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
                                  controller: non,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["Notes"]!,
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
                                  controller: price,
                                  decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: lan["amalgam"]!,
                                      // border: InputBorder.none(),
                                      border: InputBorder.none),
                                ),
                              ))),
                      SizedBox(height: height / 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
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
                                      child: Text(lan["addinvoice"]!,
                                          style: Text1,
                                          textAlign: TextAlign.center),
                                    )),
                              )),
                        ),
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

  getimge() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      data = File(image.path);
    });
  }
}
