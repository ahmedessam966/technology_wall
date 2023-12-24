import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class FacebookRedirect extends StatefulWidget {
  const FacebookRedirect({super.key});

  @override
  State<FacebookRedirect> createState() => _FacebookRedirectState();
}

class _FacebookRedirectState extends State<FacebookRedirect> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFadingCircle(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Redirecting...',
              style: context.bodyLarge?.copyWith(color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}
