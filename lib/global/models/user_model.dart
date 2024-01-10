class UserModel {
  final String id;
  final String email;
  final String name;
  final String dateCreated;
  final Map? cart;
  final String? location;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.dateCreated,
      this.cart,
      this.location});
}
