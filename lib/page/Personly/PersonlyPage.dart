import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/halp/BoxDecoration.dart';
import 'package:trucksadriver/halp/Color.dart';
import 'package:trucksadriver/halp/TextStyle.dart';
import 'package:trucksadriver/halp/lan.dart';

import '../../GetX/GetXDriver.dart';
import '../../main.dart';
import '../../model/Futu.dart';
import '../home.dart';

class personlyPage extends StatefulWidget {
  @override
  _personlyPageState createState() => _personlyPageState();
}

class _personlyPageState extends State<personlyPage> {
  var getxdriver = Get.put<GetXDriver>(GetXDriver());

  TextEditingController _nameControler = TextEditingController();
  TextEditingController _numberControler = TextEditingController();
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _ctyeControler = TextEditingController();
  TextEditingController _pasControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    imagetype = getxdriver.data.imageId.imagePage.isNotEmpty;
  }

  bool imagetype = false;

  init() {
    _nameControler.text = getxdriver.data.name;
    _numberControler.text = getxdriver.data.mobilenumber;
    _emailControler.text = getxdriver.data.email;
    _pasControler.text = getxdriver.data.password;
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
                    lan["Settings"]!,
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
                ),
                body: Container(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: width / 3.3,
                                width: width / 3.3,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: imagetype
                                        ? DecorationImage(
                                            fit: BoxFit.fill,
                                            onError: (e, ee) {
                                              setState(() {
                                                imagetype = true;
                                              });
                                            },
                                            image: (NetworkImage(
                                              getxdriver.data.imageId.imagePage,
                                            )))
                                        : DecorationImage(
                                            fit: BoxFit.fill,
                                            image: (AssetImage(
                                                "Asset/image/personicon.jpeg")))),
                              ),
                            ),
                          ),
                          Text(
                            lan["Personaldata"]!,
                            style: Text1,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.person,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["name"]!,
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _nameControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.phone_iphone_sharp,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["phone"]!,
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      readOnly: true,
                                      controller: _numberControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.alternate_email_rounded,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["E-mail"]!,
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _emailControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["password"]!,
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _pasControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                onTap: () => Update(),
                                child: Container(
                                  width: width / 1.3,
                                  height: height / 16,
                                  decoration: BtnBluBD,
                                  alignment: Alignment.center,
                                  child: Text(
                                    lan["Modification"]!,
                                    style: Text11.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            lan["GeneralSettings"]!,
                            style: Text1,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.language,
                                  color: btnborder2,
                                  size: height / 18,
                                ),
                              ),
                              Text(
                                lan["language"]!,
                                style: Text111,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "ar",
                                groupValue: lan["lan"],
                                onChanged: (v) {
                                  lan["lan"] = "ar";
                                  getxdriver.sharedPreferencesuser!
                                      .setString("lan", "ar");

                                  setlan();
                                  setState(() {
                                    lan;
                                  });

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (conte) => homePage()),
                                      (route) => false);
                                },
                              ),
                              Text(
                                lan["Arabic"]!,
                                style: Text111,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "en",
                                groupValue: lan["lan"],
                                onChanged: (v) {
                                  // print(v);
                                  lan["lan"] = "en";
                                  getxdriver.sharedPreferencesuser!
                                      .setString("lan", "en");

                                  setlan();
                                  setState(() {
                                    lan;
                                  });
                                  // print(lan);
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (conte) => homePage()),
                                      (route) => false);
                                },
                              ),
                              Text(
                                lan["English"]!,
                                style: Text111,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }

  Update() {
    FutuDriver.Edit(_nameControler.text, getxdriver.data.mobilenumber,
        _emailControler.text, _pasControler.text);
  }
}
