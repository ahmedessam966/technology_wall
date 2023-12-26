import 'package:flutter/material.dart';

class ARNotFoundPage extends StatefulWidget {
  const ARNotFoundPage({super.key});

  @override
  State<ARNotFoundPage> createState() => _ARNotFoundPageState();
}

class _ARNotFoundPageState extends State<ARNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '404 Page Not Found',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
