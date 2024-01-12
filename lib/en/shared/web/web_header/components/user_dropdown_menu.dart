import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/auth_controllers.dart';

import '../../../../../global/controllers/app_controllers.dart';

class UserDropdownMenu extends StatelessWidget {
  final String? userName;
  final AppControllers app;
  final AuthControllers auth;
  const UserDropdownMenu({super.key, required this.userName, required this.app, required this.auth});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 13.w,
      enableSearch: false,
      requestFocusOnTap: false,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: context.bodyMedium?.copyWith(color: Colors.white70),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      label: Text(
        userName?.split(' ')[0] ?? 'Account',
        style: context.bodyMedium?.copyWith(color: Colors.white70),
      ),
      leadingIcon: const Icon(
        CupertinoIcons.person_crop_circle,
        color: Colors.white70,
      ),
      trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
      selectedTrailingIcon: const Icon(Icons.arrow_drop_up, color: Colors.white70),
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: 'Account',
          label: 'My Account',
          leadingIcon: Icon(
            CupertinoIcons.person_alt,
          ),
        ),
        DropdownMenuEntry(
          value: 'Dark Mode',
          label: 'Dark Mode',
          leadingIcon: Icon(
            CupertinoIcons.moon_fill,
          ),
        ),
        DropdownMenuEntry(
          value: 'Log Out',
          label: 'Log Out',
          leadingIcon: Icon(
            CupertinoIcons.power,
          ),
        ),
      ],
      onSelected: (value) async {
        if (value != null) {
          if (value == 'Account') {
            Navigator.pushNamed(context, 'en/account');
          } else if (value == 'Dark Mode') {
          } else {
            auth.logOut();
          }
        }
      },
    );
  }
}
