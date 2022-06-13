import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trucksadriver/GetX/GetXDriver.dart';
import 'package:trucksadriver/model/Driver.dart';
import 'package:http/http.dart' as http;
import 'package:trucksadriver/model/Orde.dart';
import 'Paragraphs.dart';
import 'Section.dart';
import 'Truns.dart';
import 'Uri.dart';

var getxDriver = Get.put<GetXDriver>(GetXDriver());

class fuataCategories {
  static Future<Section> allSection() async {
    Uri url = Uri.parse(urlSection);
    var body = await http.get(url);
    Section data = Section.fromJson({});

    try {
      data = Section.fromJson(jsonDecode(body.body));
    } catch (e) {
      print(e);
    }

    return data;
  }

  static Future<Paragraphs> getdata() async {
    Uri url = Uri.parse(dataparagraphs);
    var request = http.Request('GET', url);

    http.StreamedResponse response = await request.send();
    Paragraphs data = Paragraphs.fromJson({});
    try {
      data = Paragraphs.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(data.toJson());
    } catch (e) {
      print(e);
    }

    return data;
  }

// static Future<List<Packages>> packagesbyid(String id) async {
//   Uri url = Uri.parse(GET_PACKAGES + id);
//   var body = await http.get(url);
//   List<Packages> data = [];
//   List lsitdata = [];
//
//   try {
//     lsitdata = jsonDecode(body.body)["data"];
//   } catch (e) {
//     print(e);
//   }
//   for (Map<String, dynamic> json in lsitdata) {
//     try {
//       print(json);
//       data.add(Packages.fromJson(json));
//     } catch (e) {
//       print(e);
//     }
//   }
//   return data;
// }
}

class FutuDriver {
  static Future<Truns> Longin(String mobile, String password) async {
    // var res = await http.get(Uri.parse();
    Map<String, dynamic> json = await GetMapping(
        drive + "?" + pram("mobile", mobile) + pram("password", password));

    Truns data = Truns.fromJson(json);
    if (data.stest) getxDriver.up(data.data);
    return data;
  }

  static Future<Truns> Edit(
      String name, String mobilenumber, String email, String password) async {
    Map<String, dynamic> body = {
      "name": name,
      "mobilenumber": mobilenumber,
      "email": email,
      "password": password,
      "id": getxDriver.data.id
    };
    // var headers =;
    // var res = await http.post(Uri.parse(),
    //     headers:, body: jsonEncode());
    Map<String, dynamic> json = await PostMapping(driveEdit, body,
        headers: {'Content-Type': 'application/json'});

    Truns data = Truns.fromJson(json);
    if (data.stest) getxDriver.up(data.data);
    return data;
  }

  static Future<bool> Edtbylatandlong(int id, double long, double lat) async {
    // var res = await http.post(Uri.parse(),
    //     headers:, body: jsonEncode());
    // ;
    // print();
    await GetMapping(Editbylatandlong + "/$id/$long/$lat");
    return true;
  }

  Future<Truns> Longup(Driver driver) async {
    // var headers =;
    // var res = await http.post(Uri.parse(drive),
    //     body:, headers: headers);
    Map<String, dynamic> json = await PostMapping(drive, driver.toCJson(),
        headers: {'Content-Type': 'application/json'});
    Truns data = Truns.fromJson(json);
    return data;
  }

  static Future<bool> addbank(Map<String, dynamic> data) async {
    var headers = {'Content-Type': 'application/json'};
    var res = await http.post(Uri.parse(Bank), body: data, headers: headers);
    Map<String, dynamic> json = jsonDecode(res.body);
    return true;
  }

  static Future<Truns> addDriver(Map<String, dynamic> datas) async {
    // var headers = ;

    // var res = await http.post(
    //     body: jsonEncode(),);
    // Map<String, dynamic> json = jsonDecode(res.body);
    Truns data = Truns.fromJson(
      await PostMapping(drive, datas,
          headers: {'Content-Type': 'application/json'}),
    );

    return data;
  }

  static Future<int> addBills(Map<String, dynamic> data) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(Bills
            // 'http://truck-sa.com:2368/drive/Bills'
            ));
    request.body = json.encode(data);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("////");

      return jsonDecode(await response.stream.bytesToString())["data"]["id"];
    } else {
      print("////");
      print(response.reasonPhrase);
    }
    return 0;
  }

  static Future<bool> addimageBills(int id, String path) async {
    var request = http.MultipartRequest('POST', Uri.parse(ImagedriveBills));
    request.fields.addAll({'did': id.toString()});
    request.files.add(await http.MultipartFile.fromPath('file', path));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print("/////");
      print(response.reasonPhrase);
    }
    return true;
  }
}

class FutuOrder {
  static Future<List<Orde>> getorders(int id) async {
    var data = (await GetMapping(getorder + "/$id"))["data"];
    return List<Orde>.from((data as List).map((e) => Orde.fromJson(e)));
  }

  static Future<Map<String, dynamic>> setorders(
      int drive_id, int orders_id, int reply) async {
    Map<String, dynamic> data =
        (await GetMapping(setorder + "/$drive_id/$orders_id/$reply"));
    //
    // data.addAll({
    //   "data":
    //       List<Orde>.from((data["data"] as List).map((e) => Orde.fromJson(e)))
    // });
    return data;
  }

  static Future<Map<String, dynamic>> setCasetotootde(
      int drive_id, int orders_id, int reply) async {
    Map<String, dynamic> data =
        (await GetMapping(setCasetotootder + "/$drive_id/$orders_id/$reply"));
    //
    // data.addAll({
    //   "data":
    //       List<Orde>.from((data["data"] as List).map((e) => Orde.fromJson(e)))
    // });
    return data;
  }

  static Future<Map<String, dynamic>> cancelorde(
      int drive_id, int orders_id, int room) async {
    Map<String, dynamic> data =
        (await GetMapping(cancelorder + "/$drive_id/$orders_id/$room"));
    //
    // data.addAll({
    //   "data":
    //       List<Orde>.from((data["data"] as List).map((e) => Orde.fromJson(e)))
    // });
    return data;
  }

  static Future<Map<String, dynamic>> getordersbydriver(int drive_id) async {
    Map<String, dynamic> data =
        (await GetMapping(getorderbydriver + "/$drive_id"));

    data.addAll({
      "data":
          List<Orde>.from((data["data"] as List).map((e) => Orde.fromJson(e)))
    });
    return data;
  }

  // static Future<Map<String, dynamic>> cancelorde(int drive_id) async {
  //   Map<String, dynamic> data =
  //       (await GetMapping(getorderbydriver + "/$drive_id"));
  //
  //   data.addAll({
  //     "data":
  //         List<Orde>.from((data["data"] as List).map((e) => Orde.fromJson(e)))
  //   });
  //   return data;
  // }

  static sendchat({required String message, required String idroom}) {
    PostMapping(chats, {
      "message": message,
      "customersissends": false,
      "customersnon": false,
      "idroom": idroom
    }, headers: {
      'Content-Type': 'application/json'
    });
  }
}

String pram(String Prams, String data) {
  return "$Prams=$data&";
}

Future<Map<String, dynamic>> GetMapping(String url) async {
  var request = http.Request('GET', Uri.parse(url));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString());
  } else {
    return {};
  }
}

Future<Map<String, dynamic>> PostMapping(String url, Map<String, dynamic> data,
    {dynamic headers}) async {
  // var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(url));
  request.body = json.encode(data);
  // request.body = json.encode();
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString());
  } else {
    return {};
  }
}
