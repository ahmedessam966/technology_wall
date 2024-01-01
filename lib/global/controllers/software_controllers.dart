import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/microsoft_model.dart';

class SoftwareControllers extends ChangeNotifier {
  final List<MicrosoftModel> _microsoftList = [];
  List<MicrosoftModel> get microsoftList => _microsoftList;

  Future getMicrosoft() async {
    final db = FirebaseFirestore.instance.collection('Microsoft');
    final snapshot = await db.get();

    for (final element in snapshot.docs) {
      final product = MicrosoftModel(
          id: element.id,
          title: element.data()['Title'],
          language: element.data()['Language'],
          license: element.data()['License'],
          snapshot: element.data()['Snapshot'],
          edition: element.data()['Edition'],
          cost: element.data()['Cost'],
          price: element.data()['Selling Price'],
          maxDiscounted: element.data()['Max Discounted Price'],
          users: element.data()['Users'],
          officeFeatures: element.data()['Features']);
      _microsoftList.add(product);
    }
  }
}
