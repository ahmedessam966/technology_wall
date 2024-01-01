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

  ProductModel(
      {required this.category,
      required this.id,
      required this.title,
      required this.brand,
      this.color,
      required this.cost,
      this.display,
      this.graphics,
      required this.maxDiscounted,
      this.stock,
      this.memory,
      required this.model,
      this.os,
      this.processor,
      this.series,
      required this.snapshot,
      this.storage,
      required this.price,
      this.warranty,
      this.family,
      this.toner,
      this.ppm,
      this.type,
      this.utility,
      this.network});
}
