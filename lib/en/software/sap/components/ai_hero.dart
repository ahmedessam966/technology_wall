import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArtificialIntelligenceHero extends StatelessWidget {
  const ArtificialIntelligenceHero({super.key});

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
            tag: 'ai',
            child: SvgPicture.asset('assets/icons/ai.svg'),
          ),
        ),
      ),
    );
  }
}
