import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../global/controllers/auth_controllers.dart';

class TabletHeader extends StatelessWidget {
  const TabletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo1.png',
            width: 5.w,
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // provider.changePage('Hardware Products');
                  },
                  child: Text(
                    'Hardware',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // provider.changePage('Software Products');
                  },
                  child: Text(
                    'Software',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // provider.changePage('Software Products');
                  },
                  child: Text(
                    'About',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // provider.changePage('Contact Us');
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
                  EdgeInsets.all(10.px),
                ),
                shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)))),
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
