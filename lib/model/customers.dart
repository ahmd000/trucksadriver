// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'ServerImage.dart';

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));

String customersToJson(Customers data) => json.encode(data.toJson());

class Customers {
  Customers({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.customersimage,
    // required this.walletcustomers,
    required this.time,
    required this.verificationMobilenumber,
    required this.mobilenumber,
  });

  int id;
  String name;
  double latitude;
  double longitude;
  ServerImage customersimage;

  // Walletcustomers walletcustomers;
  DateTime time;
  bool verificationMobilenumber;
  String mobilenumber;

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "null" : json["name"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        customersimage: ServerImage.fromJson(
          json["customersimage"] == null ? {} : json["customersimage"]
        ),
        // walletcustomers: json["walletcustomers"] == null ? null : Walletcustomers.fromJson(json["walletcustomers"]),
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        verificationMobilenumber: json["verificationMobilenumber"] == null
            ? false
            : json["verificationMobilenumber"],
        mobilenumber:
            json["mobilenumber"] == null ? "null" : json["mobilenumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "customersimage": customersimage,
        // "walletcustomers":
        //     walletcustomers == null ? null : walletcustomers.toJson(),
        "time": time == null ? null : time.toIso8601String(),
        "verificationMobilenumber":
            verificationMobilenumber == null ? null : verificationMobilenumber,
        "mobilenumber": mobilenumber == null ? null : mobilenumber,
      };
}

// class Walletcustomers {
//   Walletcustomers({
//     @required this.id,
//     @required this.amount,
//     @required this.time,
//     @required this.modifydate,
//   });
//
//   int id;
//   String amount;
//   DateTime time;
//   DateTime modifydate;
//
//   factory Walletcustomers.fromJson(Map<String, dynamic> json) => Walletcustomers(
//     id: json["id"] == null ? null : json["id"],
//     amount: json["amount"] == null ? null : json["amount"],
//     time: json["time"] == null ? null : DateTime.parse(json["time"]),
//     modifydate: json["modifydate"] == null ? null : DateTime.parse(json["modifydate"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "amount": amount == null ? null : amount,
//     "time": time == null ? null : time.toIso8601String(),
//     "modifydate": modifydate == null ? null : modifydate.toIso8601String(),
//   };
// }
