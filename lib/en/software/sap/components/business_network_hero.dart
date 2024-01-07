import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BusinessNetworkHero extends StatelessWidget {
  const BusinessNetworkHero({super.key});

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
            tag: 'business_net_hero',
            child: SvgPicture.asset('assets/icons/business-network.svg'),
          ),
        ),
      ),
    );
  }
}
