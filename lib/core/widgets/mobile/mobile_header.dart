import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/app_controllers.dart';

class MobileHeader extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const MobileHeader({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
    return SizedBox(
      height: sh * 0.1,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (provider.nonWebScaffoldKey.currentState!.isDrawerOpen) {
                provider.nonWebScaffoldKey.currentState?.closeDrawer();
              } else {
                provider.nonWebScaffoldKey.currentState?.openDrawer();
              }
            },
            icon: Icon(
              Icons.menu_rounded,
              color: const Color(0xaaf7f7f7).withOpacity(1),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            width: sw * 0.2,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.person_alt_circle_fill,
              color: const Color(0xaaf7f7f7).withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }
}
