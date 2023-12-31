import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LanguageRedirect extends StatefulWidget {
  final String url;
  const LanguageRedirect({super.key, required this.url});

  @override
  State<LanguageRedirect> createState() => _LanguageRedirectState();
}

class _LanguageRedirectState extends State<LanguageRedirect> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (widget.url.endsWith('/en') || widget.url.isEmpty) {
        Navigator.pushReplacementNamed(context, '/ar');
      } else {
        Navigator.pushReplacementNamed(context, '/ar/${widget.url}');
      }
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
