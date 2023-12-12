import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class MobileFooter extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const MobileFooter({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sh * 0.02),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/software/sap');
                },
                child: Text(
                  'SAP Solutions',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/software/sage');
                },
                child: Text(
                  'Sage ERP',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/software/tally');
                },
                child: Text(
                  'Tally Solutions',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/software/microsoft');
                },
                child: Text(
                  'Microsoft',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/software/fortinet');
                },
                child: Text(
                  'Fortinet',
                  style: context.bodySmall?.copyWith(color: Colors.white54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
