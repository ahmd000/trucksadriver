class Order {
  Order({
    required this.id,
    required this.startLocationLat,
    required this.startLocationLng,
    required this.startLocationAddress,
    required this.arriveLocationLat,
    required this.arriveLocationLng,
    required this.arriveLocationAddress,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.message,
    required this.ordersProducts,
    required this.ordersRoutings,
    required this.ordersOperations,
    required this.time,
    required this.acase,
  });

  int id;
  double startLocationLat;
  double startLocationLng;
  String startLocationAddress;
  double arriveLocationLat;
  double arriveLocationLng;
  String arriveLocationAddress;
  double latitude;
  double longitude;
  String price;
  String message;
  List<dynamic> ordersProducts;
  List<dynamic> ordersRoutings;
  List<dynamic> ordersOperations;
  DateTime time;
  String acase;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? 0 : json["id"],
        startLocationLat: json["startLocationLat"] == null
            ? 0.0
            : json["startLocationLat"].toDouble(),
        startLocationLng: json["startLocationLng"] == null
            ? 0.0
            : json["startLocationLng"].toDouble(),
        startLocationAddress: json["startLocationAddress"] == null
            ? "null"
            : json["startLocationAddress"],
        arriveLocationLat: json["arriveLocationLat"] == null
            ? 0.0
            : json["arriveLocationLat"].toDouble(),
        arriveLocationLng: json["arriveLocationLng"] == null
            ? 0.0
            : json["arriveLocationLng"].toDouble(),
        arriveLocationAddress: json["arriveLocationAddress"] == null
            ? "null"
            : json["arriveLocationAddress"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"],
        longitude: json["longitude"] == null ? 0.0 : json["longitude"],
        price: json["price"] == null ? "0" : json["price"],
        message: json["message"] == null ? "null" : json["message"],
        ordersProducts: json["ordersProducts"] == null
            ? []
            : List<dynamic>.from(json["ordersProducts"].map((x) => x)),
        ordersRoutings: json["ordersRoutings"] == null
            ? []
            : List<dynamic>.from(json["ordersRoutings"].map((x) => x)),
        ordersOperations: json["ordersOperations"] == null
            ? []
            : List<dynamic>.from(json["ordersOperations"].map((x) => x)),
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        acase: json["acase"] == null ? "null" : json["acase"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "startLocationLat": startLocationLat == null ? null : startLocationLat,
        "startLocationLng": startLocationLng == null ? null : startLocationLng,
        "startLocationAddress":
            startLocationAddress == null ? null : startLocationAddress,
        "arriveLocationLat":
            arriveLocationLat == null ? null : arriveLocationLat,
        "arriveLocationLng":
            arriveLocationLng == null ? null : arriveLocationLng,
        "arriveLocationAddress":
            arriveLocationAddress == null ? null : arriveLocationAddress,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "price": price == null ? null : price,
        "message": message == null ? null : message,
        "ordersProducts": ordersProducts == null
            ? null
            : List<dynamic>.from(ordersProducts.map((x) => x)),
        "ordersRoutings": ordersRoutings == null
            ? null
            : List<dynamic>.from(ordersRoutings.map((x) => x)),
        "ordersOperations": ordersOperations == null
            ? null
            : List<dynamic>.from(ordersOperations.map((x) => x)),
        "time": time == null ? null : time.toIso8601String(),
        "acase": acase == null ? null : acase,
      };
}
