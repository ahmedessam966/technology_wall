import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class ARWebFooter extends StatelessWidget {
  const ARWebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo1.png',
                            height: 80,
                          ),
                        ),
                        Center(
                          child: Text(
                            'الشركات التابعة',
                            style: context.displayLarge?.copyWith(color: Colors.white70),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/prorays.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          'المدينة المنورة - حي العريض - شارع الأمير محمد بن عبد العزيز',
                                          overflow: TextOverflow.clip,
                                          style: context.displayMedium?.copyWith(color: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.link,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri uri =
                                              Uri(scheme: 'https', path: 'prorays.techwall.com.sa');
                                          await launchUrl(uri);
                                        },
                                        child: Text(
                                          'prorays.techwall.com.sa',
                                          style: context.bodyMedium?.copyWith(color: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '+9722335228',
                                        style: context.displayMedium?.copyWith(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'info@prorays.techwall.com.sa',
                                        style: context.bodyMedium?.copyWith(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/facebook.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/instagram.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/x.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/prorays.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'دبي - الأمارات العربية المتحدة',
                                        style: context.displayMedium?.copyWith(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.link,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final Uri uri = Uri(scheme: 'https', path: 'prorays.tech-wall.me');
                                          await launchUrl(uri);
                                        },
                                        child: Text(
                                          'prorays.technology-wall.me',
                                          style: context.bodyMedium?.copyWith(color: Colors.white54),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '+9722335228',
                                        style: context.displayMedium?.copyWith(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        color: Colors.white54,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'info@prorays.tech-wall.me',
                                        style: context.bodyMedium?.copyWith(color: Colors.white54),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/facebook.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/instagram.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/x.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'بدعم من',
                              style: context.titleSmall?.copyWith(color: Colors.white70),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/ar/about/accreditation');
                              },
                              child: Image.asset(
                                'assets/images/hcc.png',
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 450,
                    child: VerticalDivider(
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'البرمجيات',
                              style: context.displayLarge?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/software/sap');
                              },
                              child: Text(
                                'حلول SAP',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/software/sage');
                              },
                              child: Text(
                                'حلول Sage',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/software/tally');
                              },
                              child: Text(
                                'حلول Tally',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/software/microsoft');
                              },
                              child: Text(
                                'مايكروسوفت',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/software/fortinet');
                              },
                              child: Text(
                                'فورتي-نت',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'الأجهزة',
                              style: context.displayLarge?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/cctv');
                              },
                              child: Text(
                                'كاميرات المراقبة',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/desktops');
                              },
                              child: Text(
                                'الأجهزة المكتبية',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/firewalls');
                              },
                              child: Text(
                                'جدار الحماية',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/notebooks');
                              },
                              child: Text(
                                'الأجهزة المحمولة',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/printers');
                              },
                              child: Text(
                                'الطابعات',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/hardware/servers');
                              },
                              child: Text(
                                'الخوادم',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'الشركة',
                              style: context.displayLarge?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/about');
                              },
                              child: Text(
                                'عن الشركة',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'عملاؤنا',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'الوظائف',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'الشئون القانونية',
                              style: context.displayLarge?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/privacy');
                              },
                              child: Text(
                                'سياسة الخصوصية',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/privacy');
                              },
                              child: Text(
                                'شروط الأستخدام',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'الأمان',
                                style: context.displayMedium?.copyWith(color: Colors.white54),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'تواصل معنا',
                              style: context.displayLarge?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '+966542575808',
                              style: context.bodySmall?.copyWith(color: Colors.white54),
                            ),
                            Text(
                              'info@tech-wall.me',
                              style: context.displayMedium?.copyWith(color: Colors.white54),
                            ),
                            Text(
                              'مكتب 27, مبنى 233, شارع جرير, سوق العليا للحاسبات',
                              overflow: TextOverflow.clip,
                              style: context.displayMedium?.copyWith(color: Colors.white54),
                            ),
                            Text(
                              '12211 الرياض, المملكة العربية السعودية',
                              overflow: TextOverflow.clip,
                              style: context.displayMedium?.copyWith(color: Colors.white54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/facebook.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/instagram.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/x.png',
                    height: 45,
                    width: 45,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              color: AppTheme.darkest.withOpacity(0.5),
              child: Center(
                child: Text(
                  '©️ تم التطوير بواسطة فريق سور التكنولوجيا. مؤسسة سور التكنولوجيا. جميع الحقوق محفوظة',
                  style: context.displayMedium?.copyWith(color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
