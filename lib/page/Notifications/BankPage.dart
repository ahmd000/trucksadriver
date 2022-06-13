import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/Widget/bodys.dart';
import 'package:trucksadriver/halp/BoxDecoration.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';

import '../../GetX/GetXDriver.dart';
import '../../Widget/bank.dart';
import '../../Widget/recordsBills.dart';
import '../../halp/Color.dart';
import '../../model/Uri.dart';

class BankPage extends StatefulWidget {
  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  var getxdriver = Get.put<GetXDriver>(GetXDriver());
  int recordsindex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Bodys(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height / 35,),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(lan["cards"]!, style: Text1),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context, builder: (context) => bankadd());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "+",
                        style: Text1.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38, blurRadius: 2, spreadRadius: 1)
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: width / 10,
                  height: height / 13,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: width,
                height: height / 4,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        recordsindex = index;
                      });
                    },
                    controller: PageController(viewportFraction: 0.9),
                    itemCount: getxdriver.data.bankdrive.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 4,
                          shadowColor: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: width / 1.35,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          getxdriver.data.bankdrive[index]
                                              .beneficiaryName,
                                          style: Text1,
                                        ),
                                      )),
                                  Container(
                                      width: width / 1.35,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          getxdriver.data.bankdrive[index]
                                              .accountnumber,
                                          style: Text1,
                                        ),
                                      )),
                                  Container(
                                      width: width / 1.35,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          getxdriver
                                              .data.bankdrive[index].ibannumber,
                                          style: Text1,
                                        ),
                                      )),
                                  Container(
                                      width: width / 1.35,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          getxdriver
                                              .data.bankdrive[index].bankname,
                                          style: Text1,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                // bottom: (height / 4) / 1.5,
                top: 0,
                left: width / 30,
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getxdriver.data.walletdrive.amount,
                      style: Text0.copyWith(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38, blurRadius: 2, spreadRadius: 1)
                    ],
                    color: btnborder,
                    shape: BoxShape.circle,
                  ),
                  width: width / 10,
                  height: height / 13,
                ),
              ),
              // Positioned(
              //   // bottom: (height / 4) / 1.5,
              //   bottom: 5,
              //   left: width / 30,
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         "+",
              //         style: Text1.copyWith(color: Colors.black),
              //       ),
              //     ),
              //     decoration: BoxDecoration(
              //       boxShadow: [
              //         BoxShadow(
              //             color: Colors.black38, blurRadius: 2, spreadRadius: 1)
              //       ],
              //       color: Colors.white,
              //       shape: BoxShape.circle,
              //     ),
              //     width: width / 10,
              //     height: height / 13,
              //   ),
              // )
            ],
          ),
          getxdriver.data.bankdrive.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(lan["records"]!, style: Text1),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => recordsBills(getxdriver
                                    .data.bankdrive[recordsindex].id));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "+",
                              style: Text1.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                spreadRadius: 1)
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        width: width / 10,
                        height: height / 13,
                      ),
                    ],
                  ),
                ),
          Container(
            width: width,
            height: height / 2.1,
            child: ListView.builder(
                itemCount: getxdriver.data.bankdrive.isEmpty
                    ? 0
                    : getxdriver.data.bankdrive[recordsindex].bills.length,
                itemBuilder: (context, index) {
                  print(getxdriver.data.bankdrive[recordsindex].bills[index]
                      .image.imagePage);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 10,
                      child: Row(
                        children: [
                          Container(
                            height: height / 10,
                            width: height / 10,
                            decoration: inputBD.copyWith(
                                image: DecorationImage(
                                    image: NetworkImage(getxdriver
                                        .data
                                        .bankdrive[recordsindex]
                                        .bills[index]
                                        .image
                                        .imagePage))),
                          ),
                          Container(
                              width: width / 1.35,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  getxdriver.data.bankdrive[recordsindex]
                                          .bills[index].price +
                                      " " +
                                      lan["Rial"]!,
                                  style: Text1,
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
