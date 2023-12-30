class DekstopModel {
  final String id;
  final String title;
  final String brand;
  final int? stock;
  final num cost;
  final String graphics;
  final num maxDiscounted;
  final String memory;
  final String model;
  final String os;
  final String processor;
  final String series;
  final String snapshot;
  final String storage;
  final num price;
  final String warranty;

  DekstopModel(
      {required this.id,
      required this.title,
      required this.brand,
      this.stock,
      required this.cost,
      required this.graphics,
      required this.maxDiscounted,
      required this.memory,
      required this.model,
      required this.os,
      required this.processor,
      required this.series,
      required this.snapshot,
      required this.storage,
      required this.price,
      required this.warranty});
}
