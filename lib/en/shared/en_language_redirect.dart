import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EnLanguageRedirect extends StatefulWidget {
  const EnLanguageRedirect({super.key});

  @override
  State<EnLanguageRedirect> createState() => _EnLanguageRedirectState();
}

class _EnLanguageRedirectState extends State<EnLanguageRedirect> {
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
