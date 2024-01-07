import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BusinessTechHero extends StatelessWidget {
  const BusinessTechHero({super.key});

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
            tag: 'business_tech_hero',
            child: SvgPicture.asset('assets/icons/business-tech-platform.svg'),
          ),
        ),
      ),
    );
  }
}
