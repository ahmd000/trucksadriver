// To parse this JSON data, do
//
//     final bankdrive = bankdriveFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'ServerImage.dart';

Bankdrive bankdriveFromJson(String str) => Bankdrive.fromJson(json.decode(str));

String bankdriveToJson(Bankdrive data) => json.encode(data.toJson());

class Bankdrive {
  Bankdrive({
    required this.id,
    required this.accountnumber,
    required this.time,
    required this.bills,
    required this.beneficiaryName,
    required this.bankname,
    required this.bank,
    required this.ibannumber,
  });

  int id;
  String accountnumber;
  DateTime time;
  List<Bill> bills;
  String beneficiaryName;
  String bankname;
  Bank bank;
  String ibannumber;

  factory Bankdrive.fromJson(Map<String, dynamic> json) => Bankdrive(
        id: json["id"] == null ? 0 : json["id"],
        accountnumber:
            json["accountnumber"] == null ? "" : json["accountnumber"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        bills: json["bills"] == null
            ? []
            : List<Bill>.from(json["bills"].map((x) => Bill.fromJson(x))),
        beneficiaryName:
            json["beneficiaryName"] == null ? "null" : json["beneficiaryName"],
        bankname: json["bankname"] == null ? "" : json["bankname"],
        bank: Bank.fromJson(json["bank"] == null ? {} : json["bank"]),
        ibannumber: json["ibannumber"] == null ? "null" : json["ibannumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "accountnumber": accountnumber == null ? null : accountnumber,
        "time": time == null ? null : time.toIso8601String(),
        "beneficiaryName": beneficiaryName == null ? null : beneficiaryName,
        "bankname": bankname == null ? null : bankname,
        "bank": bank == null ? null : bank.toJson(),
        "ibannumber": ibannumber == null ? null : ibannumber,
      };
}

class Bank {
  Bank({
    required this.id,
    required this.time,
    required this.imagePage,
  });

  int id;
  DateTime time;
  String imagePage;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"] == null ? 0 : json["id"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        imagePage: json["imagePage"] == null ? "null" : json["imagePage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "time": time == null ? null : time.toIso8601String(),
        "imagePage": imagePage == null ? null : imagePage,
      };
}

class Bill {
  Bill({
    required this.id,
    required this.price,
    required this.non,
    required this.image,
    required this.time,
    required this.acase,
  });

  int id;
  String price;
  dynamic non;
  ServerImage image;
  DateTime time;
  dynamic acase;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json["id"] == null ? 0 : json["id"],
        price: json["price"] == null ? "null" : json["price"],
        image: ServerImage.fromJson(json["image"] == null ? {} : json["image"]),
        non: json["non"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        acase: json["acase"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "price": price == null ? null : price,
        "non": non,
        "image": image,
        "time": time == null ? null : time.toIso8601String(),
        "acase": acase,
      };
}
