import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../../global/controllers/auth_controllers.dart';
import '../../web_login_type_selector.dart';

class SignInButton extends StatelessWidget {
  final AuthControllers auth;
  const SignInButton({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(10.px),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.px)))),
      onPressed: () async {
        await showAdaptiveDialog(
            context: context,
            builder: (ctx) {
              return const WebLoginTypeSelector();
            });
      },
      icon: Row(
        children: [
          Text('Sign In', style: context.bodyLarge?.copyWith(color: Colors.black)),
          const Icon(Icons.arrow_right_alt_outlined),
        ],
      ),
    );
  }
}
