import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../controllers/auth_controllers.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      container: true,
      button: true,
      readOnly: true,
      label: 'Technology Wall, Tech-Wall, tech-wall.me',
      value:
          'Computers, Laptops, Computer Hardware, Computer Software, ERP, SAP, SAP Business One, SAP 4/Hana, S4/Hana, Zoho, Zoho ERP, Sage, Sage Software, Sage ERP, Networking, Contact Us, About, ',
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Semantics(
                    label: 'Main Logo',
                    image: true,
                    link: true,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 90,
                    ),
                  ),
                ),
                Text(
                  'Powered By HCC',
                  style: context.bodySmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
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
                      Navigator.pushNamed(context, '/hardware');
                    },
                    child: Text(
                      'Hardware',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/software');
                    },
                    child: Text(
                      'Software',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/software/sap');
                    },
                    child: Text(
                      'SAP Solutions',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Services',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      'About TW',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact-us');
                    },
                    child: Text(
                      'Contact Us',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Semantics(
              button: true,
              label: 'Zoho Customer Portal Login Button',
              child: IconButton(
                padding: const EdgeInsets.all(10),
                tooltip: 'Zoho Customer Portal',
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(const Color(0xaaf1f1f1).withOpacity(1)),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.pushNamed(context, '/portal');
                },
                icon: Row(
                  children: [
                    Builder(builder: (context) {
                      final String? name =
                          Provider.of<AuthControllers>(context, listen: false).staffModel?.name.split('')[0];
                      return Text(
                        name ?? 'Sign In',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                      );
                    }),
                    const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
