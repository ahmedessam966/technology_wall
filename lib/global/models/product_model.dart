class ProductModel {
  final String category;
  final String id;
  final String title;
  final String brand;
  final String? color;
  final num cost;
  final String? display;
  final String? graphics;
  final num maxDiscounted;
  final int? stock;
  final String? memory;
  final String? model;
  final String? os;
  final String? processor;
  final String? series;
  final String snapshot;
  final String? storage;
  final num price;
  final String? warranty;
  final String? family;
  final String? toner;
  final double? ppm;
  final String? type;
  final String? utility;
  final String? network;
  final String? users;
  final String? officeFeatures;
  final String? edition;
  final String? license;
  final String? language;

  ProductModel(
      {required this.category,
      required this.id,
      required this.title,
      required this.brand,
      required this.price,
      required this.cost,
      required this.maxDiscounted,
      required this.snapshot,
      this.model,
      this.color,
      this.display,
      this.graphics,
      this.stock,
      this.memory,
      this.os,
      this.processor,
      this.series,
      this.storage,
      this.warranty,
      this.family,
      this.toner,
      this.ppm,
      this.type,
      this.utility,
      this.network,
      this.users,
      this.officeFeatures,
      this.edition,
      this.license,
      this.language});
}
