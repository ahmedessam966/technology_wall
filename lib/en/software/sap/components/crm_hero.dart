import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CRMHero extends StatelessWidget {
  const CRMHero({super.key});

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
            tag: 'crm_hero',
            child: SvgPicture.asset('assets/icons/crm.svg'),
          ),
        ),
      ),
    );
  }
}
