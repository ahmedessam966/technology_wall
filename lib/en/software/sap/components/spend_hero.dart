import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpendManagementHero extends StatelessWidget {
  const SpendManagementHero({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        if (value) {
          return;
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Dialog(
        child: Center(
          child: Hero(
            tag: 'spend_hero',
            child: SvgPicture.asset('assets/icons/spend.svg'),
          ),
        ),
      ),
    );
  }
}
