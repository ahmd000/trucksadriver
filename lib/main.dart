import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/halp/lan.dart';
import 'package:trucksadriver/page/home.dart';
import 'GetX/GetXData.dart';
import 'GetX/GetXDriver.dart';
import 'page/Error.dart';
import 'page/Registration/CreateAccountPage.dart';
import 'page/Registration/Introduction.dart';

var getxDriver = Get.put<GetXDriver>(GetXDriver());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var GetXdata = Get.put<GetXData>(GetXData());
  GetXdata.getdata();
  await getxDriver.int();
  setlan();
  await getxDriver.getuser();
  print(getxDriver.data.id);

  runApp(MyApp(getxDriver.data.id == 0 ? false : true));
}

void setlan() {
  if (getxDriver.sharedPreferencesuser!.getString("lan") == null ||
      getxDriver.sharedPreferencesuser!.getString("lan") == "ar") {
    lan = lanar;
    lan.addAll({"lan": "ar"});

    getxDriver.sharedPreferencesuser!.setString("lan", "ar");
  } else if (getxDriver.sharedPreferencesuser!.getString("lan") == "en") {
    lan = lanen;
    lan.addAll({"lan": "en"});
    getxDriver.sharedPreferencesuser!.setString("lan", "en");
  }
  print(lan);
}

class MyApp extends StatelessWidget {
  bool type;

  MyApp(this.type); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: type ? homePage() : introduction(),
      // home: Erro(),
    );
  }
}

class settings {
  static TextDirection lanDirection = TextDirection.rtl;
}
