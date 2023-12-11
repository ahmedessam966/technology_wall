class ProductModel {
  final String id;
  final String brand;
  final String model;
  final String serial;
  final String specs;
  final num price;
  final num discounted;
  final num cost;
  final String? firstPath;

  ProductModel({
    required this.id,
    required this.brand,
    required this.model,
    required this.serial,
    required this.specs,
    required this.price,
    required this.discounted,
    required this.cost,
    this.firstPath,
  });
}
