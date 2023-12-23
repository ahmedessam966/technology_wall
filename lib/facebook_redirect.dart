import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
