import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/app_controllers.dart';
import '../../controllers/auth_controllers.dart';

class TabletHeader extends StatelessWidget {
  final double sw;
  final double sh;
  final double ar;
  const TabletHeader({super.key, required this.sw, required this.sh, required this.ar});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
    return SizedBox(
      height: sh * 0.1,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo1.png',
            width: sw * 0.1,
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(ar * 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    provider.changePage('Hardware Products');
                  },
                  child: Text(
                    'Hardware',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage('Software Products');
                  },
                  child: Text(
                    'Software',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage('Software Products');
                  },
                  child: Text(
                    'About',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage('Contact Us');
                  },
                  child: Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
                elevation: const MaterialStatePropertyAll(0),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.all(ar * 10),
                ),
                shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(ar * 10)))),
            onPressed: () {},
            child: Row(
              children: [
                Builder(builder: (context) {
                  final String? name =
                      Provider.of<AuthControllers>(context, listen: false).staffModel?.name.split('')[0];
                  return Text(
                    name ?? 'Sign In',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  );
                }),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
