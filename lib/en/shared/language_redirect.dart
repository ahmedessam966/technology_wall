import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LanguageRedirect extends StatefulWidget {
  const LanguageRedirect({super.key});

  @override
  State<LanguageRedirect> createState() => _LanguageRedirectState();
}

class _LanguageRedirectState extends State<LanguageRedirect> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/ar');
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
