import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trucksadriver/model/Driver.dart';

import '../model/Futu.dart';
import '../model/Truns.dart';
import 'GetXData.dart';

class GetXDriver extends GetxController {
  Driver data = Driver.fromJson({});
  SharedPreferences? sharedPreferencesuser;
  bool runing = true;
  var getxdata = Get.put<GetXData>(GetXData());

  Future<void> int() async {
    sharedPreferencesuser = await SharedPreferences.getInstance();
  }

  setmaponlocaldatastorg(Map<String, dynamic> data) async {
    await sharedPreferencesuser!.setString("user", jsonEncode(data));
  }

  out() {
    data = Driver.fromJson({});
    runing = false;
    sharedPreferencesuser!.remove("user");
    update();
  }

  getdatafromlocalstorg() async {
    String data = await sharedPreferencesuser!.getString("user")!;
    return jsonDecode(data);
  }

  Future<Driver> adddata(Driver d) async {
    // _sharedPreferencesuser!.setString("driver", d.toEJson());
    // String value = (await _sharedPreferencesuser!.getString("driver")!);

    data = d;

    // print("_sharedPreferencesuser");

    return data;
  }

  up(Driver data) {
    this.data = data;
    // geting(data.mobilenumber, data.password);
    // adddata(data);
    setmaponlocaldatastorg(data.toEJson());
    update();
  }

  Future<void> geting(mobile, password) async {
    // print("object");
    runing = true;
    while (runing) {
      await Future.delayed(Duration(milliseconds: 2));
      Truns d = await FutuDriver.Longin(mobile, password);
      data = d.data;
      // print(data.orders);
      setmaponlocaldatastorg(data.toEJson());

      getxdata.getorderorderral(data.orders
          .where((element) =>
              element.acase == "2" ||
              element.acase == "3" ||
              element.acase == "4" ||
              element.acase == "9")
          .map((e) => e)
          .toList());
      // print(getxdata.orderreqwati);
      update();
    }
    if (!runing) sharedPreferencesuser!.remove("user");
  }

  Future<Driver> getuser() async {
    try {
      String value = (await sharedPreferencesuser!.getString("user")!);
      print(value);
      // print(mapfromstring(value));
      Map<String, dynamic> jsons = mapfromstring(value);
      data = Driver.fromJson(jsons);
      // up(data);
    } catch (e) {
      data = Driver.fromJson({});
      print(e);
    }
    // print(data.toEJson());
    return data;
  }
}

Map<String, dynamic> mapfromstring(String source) {
  // Map<String, dynamic> mapData =data as Map<String, dynamic>;
  // List body = data.split('');
  // print(body);
  // for (int i = 0; i < body.length; i++) {
  // //   var element = body[i];
  // //   mapData.addAll({element.split(':')[0]: element.split(':')[1]});
  // // }

  return jsonDecode(source);
}
