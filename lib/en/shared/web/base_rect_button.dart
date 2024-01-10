import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseRectButton extends StatelessWidget {
  final dynamic action;
  final dynamic child;
  const BaseRectButton({super.key, this.action, this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(15.px)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
              side: const BorderSide(color: Colors.white70),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return const Color(0xaa7c9cc1).withOpacity(1);
            } else {
              return const Color(0xaa1a374d).withOpacity(1);
            }
          }),
        ),
        onPressed: action,
        child: child);
  }
}
