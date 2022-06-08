import 'Driver.dart';

class Truns<T> {
  Truns({
    required this.stest,
    required this.data,
    required this.mesg,
  });

  bool stest;
  Driver data;
  String mesg;

  factory Truns.fromJson(Map<String, dynamic> json) => Truns(
        stest: json["stest"] == null ? false : json["stest"],
        data: Driver.fromJson(json["data"] == null ? {} : json["data"]),
        mesg: json["mesg"] == null ? "null" : json["mesg"],
      );

  Map<String, dynamic> toJson() => {
        "stest": stest == null ? null : stest,
        "data": data.toEJson(),
        "mesg": mesg == null ? null : mesg,
      };
}
