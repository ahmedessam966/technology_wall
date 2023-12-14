class PrinterModel {
  final String id;
  final String title;
  final String brand;
  final String model;
  final num price;
  final num cost;
  final num discounted;
  final int stock;
  final String family;
  final String toner;
  final double ppm;
  final String type;
  final String utility;
  final String snapshot;
  final String network;

  PrinterModel(
      {required this.id,
      required this.title,
      required this.brand,
      required this.model,
      required this.price,
      required this.cost,
      required this.discounted,
      required this.stock,
      required this.family,
      required this.toner,
      required this.ppm,
      required this.type,
      required this.utility,
      required this.snapshot,
      required this.network});
}
