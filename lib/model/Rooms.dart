import 'Chat.dart';
import 'customers.dart';
// import 'Drives.dart';

class Rooms {
  Rooms({
    required this.id,
    required this.customers,
    required this.stuteroom,
    required this.time,
    required this.drive_id,
    required this.chat,
  });

  int id;
  Customers customers;
  bool stuteroom;
  int drive_id;
  DateTime time;
  List<Chat> chat;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        id: json["id"] == null ? 0 : json["id"],
        drive_id: json["drive_id"] == null ? 0 : json["drive_id"],
        customers: Customers.fromJson(
            json["customers"] == null ? {} : json["customers"]),
        stuteroom: json["stuteroom"] == null ? false : json["stuteroom"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        chat: json["chat"] == null
            ? []
            : List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "customers": customers.toJson(),
        "stuteroom": stuteroom == null ? null : stuteroom,
        "time": time == null ? null : time.toIso8601String(),
        "chat": chat == null
            ? null
            : List<dynamic>.from(chat.map((x) => x.toJson())),
      };
}
