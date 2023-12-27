import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DevRedirect extends StatefulWidget {
  const DevRedirect({super.key});

  @override
  State<DevRedirect> createState() => _DevRedirectState();
}

class _DevRedirectState extends State<DevRedirect> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/dev');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.white70,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Redirecting to Development Center',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
