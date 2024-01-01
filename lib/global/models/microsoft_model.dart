class MicrosoftModel {
  final String id;
  final String title;
  final String language;
  final int? stock;
  final String license;
  final String snapshot;
  final String edition;
  final num cost;
  final num price;
  final num maxDiscounted;
  final String users;
  final String? officeFeatures;

  MicrosoftModel(
      {required this.id,
      required this.title,
      required this.language,
      this.stock,
      required this.license,
      required this.snapshot,
      required this.edition,
      required this.cost,
      required this.price,
      required this.maxDiscounted,
      required this.users,
      this.officeFeatures});
}
