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
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: const Color(0xaaf7f7f7).withOpacity(1),
            ),
          ),
          Image.network(
            'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flogo.png?alt=media&token=7e9379d8-ebbd-4797-b41d-43267a0be3ac',
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
