import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/404.svg',
              height: 90.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Page Not Found',
              style: context.headlineLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextButton(
              style: const ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder())),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/en');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    'Return to Home Page',
                    style: context.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
