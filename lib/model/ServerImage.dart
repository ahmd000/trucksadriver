import 'Uri.dart';

class ServerImage {
  ServerImage({
    required this.id,
    required this.time,
    required this.imagePage,
  });

  int id;
  DateTime time;
  String imagePage;

  factory ServerImage.fromJson(Map<String, dynamic> json) => ServerImage(
        id: json["id"] == null ? 0 : json["id"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        imagePage: urinet +(json["imagePage"] == null ? "null" :json["imagePage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "time": time == null ? null : time.toIso8601String(),
        "imagePage": imagePage == null ? null : imagePage,
      };
}
