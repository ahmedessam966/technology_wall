class MicrosoftModel {
  final String id;
  final String title;
  final String language;
  final String license;
  final String snapshot;
  final String edition;
  final num cost;
  final num price;
  final num maxDiscounted;
  final String users;

  MicrosoftModel(
      {required this.id,
      required this.title,
      required this.language,
      required this.license,
      required this.snapshot,
      required this.edition,
      required this.cost,
      required this.price,
      required this.maxDiscounted,
      required this.users});
}
