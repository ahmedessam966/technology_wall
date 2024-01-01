class NotebookModel {
  final String id;
  final String title;
  final String brand;
  final String color;
  final num cost;
  final int? stock;
  final String display;
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

  NotebookModel(
      {required this.id,
      required this.title,
      required this.brand,
      required this.color,
      required this.cost,
      this.stock,
      required this.display,
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
