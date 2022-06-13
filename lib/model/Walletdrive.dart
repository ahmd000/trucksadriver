class Walletdrive {
  Walletdrive({
    required this.id,
    required this.amount,
    required this.time,
    required this.modifydate,
  });

  int id;
  String amount;
  DateTime time;
  DateTime modifydate;

  factory Walletdrive.fromJson(Map<String, dynamic> json) => Walletdrive(
        id: json["id"] == null ? 0 : json["id"],
        amount: json["amount"] == null ? "null" : json["amount"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        modifydate: json["modifydate"] == null
            ? DateTime.now()
            : DateTime.parse(json["modifydate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "amount": amount == null ? null : amount,
        "time": time == null ? null : time.toIso8601String(),
        "modifydate": modifydate == null ? null : modifydate.toIso8601String(),
      };
}
