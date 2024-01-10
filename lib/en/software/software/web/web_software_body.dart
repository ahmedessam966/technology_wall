import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/software/software/components/microsoft_products_builder.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../../../shared/web/cart_widget.dart';
import '../../../shared/web/direct_dependencies_index.dart';

class WebSoftwareBody extends StatelessWidget {
  const WebSoftwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const WebBlueHero(
            titleBig: 'Boost Your Digital Entity With Powerful Software Solutions',
            titleSmall: '',
            firstHead: 'For Personal Use',
            firstSub: 'Licenses for personal use',
            secondHead: 'For Enterprise',
            secondSub: 'Licensed, supported software solutions required for business intelligence',
            actionPhrase: 'Save valuable time and effort. Explore our integrated solutions plan.',
            hasButton: false,
            image:
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsoftware.webp?alt=media&token=3a0e1b63-26e8-4a6d-8d26-fda01a8c2493'),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
              height: 12.h,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2',
              height: 12.h,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
              height: 12.h,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
              height: 10.h,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
              height: 12.h,
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          color: const Color(0xaaf1f1f1).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FMicrosoft%2Fmicrosoft.webp?alt=media&token=9f55e60e-2280-468c-8247-7159ed9d2a0e',
                    width: 25.w,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(15.px)),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                          side: const BorderSide(color: Colors.white70),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return const Color(0xaa7c9cc1).withOpacity(1);
                        } else {
                          return const Color(0xaa071923).withOpacity(1);
                        }
                      }),
                    ),
                    onPressed: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const CartWidget();
                          });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          'View Cart (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                          style: context.bodyLarge?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Center(
                child: Text(
                  'Popular Microsoft Products',
                  style: context.headlineMedium,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(height: 75.h, child: const MicrosoftProductsBuilder()),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'Looking for other Microsoft products?',
                  style: context.bodyLarge,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: BaseRectButton(
                child: Text('Microsoft Software Center',
                    style: context.bodyLarge?.copyWith(
                        color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                action: () {
                  Navigator.pushNamed(context, '/en/software/microsoft');
                },
              )),
              SizedBox(
                height: 5.h,
              ),
              const Divider(),
              SizedBox(
                height: 5.h,
              ),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FFortinet%2Ffortinet.webp?alt=media&token=0b7d7ad7-159d-4355-8660-8257c4f1ab7c',
                width: 25.w,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'Fortinet Software Products',
                  style: context.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
