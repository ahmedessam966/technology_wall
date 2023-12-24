import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EnLanguageRedirect extends StatefulWidget {
  final String url;
  const EnLanguageRedirect({super.key, required this.url});

  @override
  State<EnLanguageRedirect> createState() => _EnLanguageRedirectState();
}

class _EnLanguageRedirectState extends State<EnLanguageRedirect> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (widget.url.endsWith('/ar') || widget.url.isEmpty) {
        Navigator.pushReplacementNamed(context, '/en');
      } else {
        Navigator.pushReplacementNamed(context, '/en/${widget.url}');
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
