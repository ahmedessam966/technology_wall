import 'package:flutter/material.dart';

class NonWebDrawer extends StatelessWidget {
  final double width;
  const NonWebDrawer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width < 768 ? width * 0.75 : width * 0.55,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
