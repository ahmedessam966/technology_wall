import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controllers/app_controllers.dart';
import '../../controllers/auth_controllers.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo1.png'),
          const Spacer(),
          Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'Hardware Products');
                  },
                  child: Text(
                    'Hardware',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'Software Products');
                  },
                  child: Text(
                    'Software',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'AMCs');
                  },
                  child: Text(
                    'AMCs',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'Networking');
                  },
                  child: Text(
                    'Networking',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'SAP');
                  },
                  child: Text(
                    'SAP Solutions',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'Services');
                  },
                  child: Text(
                    'Services',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.changePage(0, 'Contact Us');
                  },
                  child: Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 16),
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
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(20),
                ),
                shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
            onPressed: () {},
            child: Row(
              children: [
                Builder(builder: (context) {
                  final String? name =
                      Provider.of<AuthControllers>(context, listen: false).staffModel?.name.split('')[0];
                  return Text(
                    name ?? 'Sign In',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 16),
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
