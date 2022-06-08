import 'package:trucksadriver/model/Order.dart';

import 'Bankdrive.dart';
import 'Car.dart';
import 'Orde.dart';
import 'ServerImage.dart';
import 'Walletdrive.dart';
import 'driverProducts.dart';

class Driver {
  Driver({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.password,
    required this.walletdrive,
    required this.driverProducts,
    required this.time,
    required this.mobilenumber,
    required this.bankdrive,
    required this.verificationMobilenumber,
    required this.imageId,
    required this.car,
    required this.idphotocopydrive,
    required this.driverlicensephoto,
    required this.cases,
    required this.orders,
  });

  int? id;
  String name;
  double latitude;
  double longitude;
  String email;
  String password;
  Walletdrive walletdrive;
  List<DriverProduct> driverProducts;
  DateTime time;
  String mobilenumber;
  bool verificationMobilenumber;
  List<Car> car;
  dynamic idphotocopydrive;
  dynamic driverlicensephoto;
  dynamic cases;
  ServerImage imageId;
  List<Bankdrive> bankdrive;
  List<Orde> orders;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "null" : json["name"],
        bankdrive: json["bankdrive"] == null
            ? []
            : List<Bankdrive>.from(
                json["bankdrive"].map((x) => Bankdrive.fromJson(x))),
        latitude: json["latitude"] == null ? 0 : json["latitude"],
        longitude: json["longitude"] == null ? 0 : json["longitude"],
        email: json["email"] == null ? "null" : json["email"],
        password: json["password"] == null ? "null" : json["password"],
        walletdrive: Walletdrive.fromJson(
            json["walletdrive"] == null ? {} : json["walletdrive"]),
        driverProducts: json["driverProducts"] == null
            ? []
            : List<DriverProduct>.from(
                json["driverProducts"].map((x) => DriverProduct.fromJson(x))),
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        mobilenumber:
            json["mobilenumber"] == null ? "null" : json["mobilenumber"],
        verificationMobilenumber: json["verificationMobilenumber"] == null
            ? false
            : json["verificationMobilenumber"],
        imageId: ServerImage.fromJson(
            json["image_id"] == null ? {} : json["image_id"]),
        car: json["car"] == null
            ? []
            : List<Car>.from(json["car"].map((x) => Car.fromJson(x))),
        idphotocopydrive: json["idphotocopydrive"],
        driverlicensephoto: json["driverlicensephoto"],
        cases: json["cases"],
        orders: json["orderes"] == null
            ? []
            : List<Orde>.from(
                json["orderes"].map((json) => Orde.fromJson(json))),
      );

  Map<String, dynamic> toCJson() => {
        "name": name == null ? "null" : name,
        "latitude": latitude == null ? 0 : latitude,
        "longitude": longitude == null ? 0 : longitude,
        "email": email == null ? "null" : email,
        "password": password == null ? "00" : password,
        "walletdrive": walletdrive,
        "driverProducts": driverProducts == null
            ? []
            : List<dynamic>.from(driverProducts.map((x) => x.toJson())),
        "time": time == null
            ? DateTime.now().toIso8601String()
            : time.toIso8601String(),
        "mobilenumber": mobilenumber == null ? "000" : mobilenumber,
        "verificationMobilenumber": verificationMobilenumber,
        "image_id": imageId,
        "car":
            car == null ? null : List<dynamic>.from(car.map((x) => x.toJson())),
        "idphotocopydrive": idphotocopydrive,
        "driverlicensephoto": driverlicensephoto,
        "cases": cases,
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders.map((x) => x.toJson())),
      };

  Map<String, dynamic> toEJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "walletdrive": walletdrive == null ? null : walletdrive.toJson(),
        "driverProducts": driverProducts == null
            ? null
            : List<dynamic>.from(driverProducts.map((x) => x.toJson())),
        // "time": time == null ? null : time.toIso8601String(),
        "car":
            car == null ? null : List<dynamic>.from(car.map((x) => x.toJson())),
        "mobilenumber": mobilenumber == null ? null : mobilenumber,
        "verificationMobilenumber":
            verificationMobilenumber == null ? null : verificationMobilenumber,
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}
