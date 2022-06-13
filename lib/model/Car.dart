class Car {
  Car({
    required this.id,
    required this.truckcolor,
    required this.car,
    required this.time,
    required this.plateNumber,
  });

  int id;
  String truckcolor;
  dynamic car;
  DateTime time;
  String plateNumber;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    id: json["id"] == null ? 0 : json["id"],
    truckcolor: json["truckcolor"] == null ? "null" : json["truckcolor"],
    car: json["car"],
    time: json["time"] == null ? DateTime.now() : DateTime.parse(json["time"]),
    plateNumber: json["plateNumber"] == null ? "null" : json["plateNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "truckcolor": truckcolor == null ? null : truckcolor,
    // "car": car,
    "time": time == null ? null : time.toIso8601String(),
    "plateNumber": plateNumber == null ? null : plateNumber,
  };
}
