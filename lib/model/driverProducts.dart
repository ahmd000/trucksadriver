
class DriverProduct {
  DriverProduct({
    required this.id,
    required this.product,
    required this.driverId,
  });

  int id;
  Product product;
  int driverId;

  factory DriverProduct.fromJson(Map<String, dynamic> json) => DriverProduct(
    id: json["id"] == null ? 0 : json["id"],
    product:Product.fromJson( json["product"] == null ? {} : json["product"]),
    driverId: json["driver_id"] == null ? 0 : json["driver_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product": product == null ? null : product.toJson(),
    "driver_id": driverId == null ? null : driverId,
  };
}

class Product {
  Product({
    required this.id,
    required this.names,
    required this.price,
    required this.time,
    required this.imageProduct,
  });

  int id;
  dynamic names;
  String price;
  dynamic time;
  dynamic imageProduct;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? 0 : json["id"],
    names: json["names"] == null ? "null" : json["names"],
    price: json["price"] == null ? "null" : json["price"],
    time: json["time"] == null ? DateTime.now() : DateTime.parse(json["time"]),
    imageProduct: json["imageProduct"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "names": names,
    "price": price == null ? null : price,
    // "time": time,
    // "imageProduct": imageProduct,
  };
}