import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ARNotFoundPage extends StatefulWidget {
  const ARNotFoundPage({super.key});

  @override
  State<ARNotFoundPage> createState() => _ARNotFoundPageState();
}

class _ARNotFoundPageState extends State<ARNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/404.svg',
                height: 150.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'الصفحة غير موجودة',
                style: context.titleLarge?.copyWith(color: Colors.white70, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextButton(
                style: const ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder())),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/ar');
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
                      'العودة للصفحة الرئيسية',
                      style: context.displayLarge?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
