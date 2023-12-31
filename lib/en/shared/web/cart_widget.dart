import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/cart_controllers.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartControllers>(builder: (context, provider, _) {
      return Dialog(
        backgroundColor: const Color(0xaaf3f3f3).withOpacity(1),
        surfaceTintColor: const Color(0xaaf3f3f3).withOpacity(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.px),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Cart',
                    style: context.headlineLarge,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: provider.cart.isEmpty ? 30.h : 2.5.h,
              ),
              provider.cart.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : SizedBox(
                      height: 45.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 1.h,
                        ),
                        itemCount: provider.cart.keys.length,
                        itemBuilder: (context, index) {
                          String key = provider.cart.keys.elementAt(index);
                          final item = provider.cart[key];
                          return ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                                side: const BorderSide(color: Colors.black)),
                            title: Text(
                              item.title,
                              style: context.headlineSmall?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              'Product ID: ${item.id}',
                              style: context.bodyLarge,
                            ),
                            trailing: IconButton(
                              tooltip: 'Remove From Cart',
                              onPressed: () {
                                provider.removeFromCart(item.id);
                              },
                              icon: const Icon(
                                Icons.delete_forever,
                                color: AppTheme.prohibit,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              const Spacer(),
              provider.cart.isEmpty
                  ? const SizedBox.shrink()
                  : Container(
                      color: const Color(0xaaf3f3f3).withOpacity(1),
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                      child: Center(
                        child: ElevatedButton(
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
                          onPressed: () {},
                          child: Text(
                            'Proceed To Checkout',
                            style: context.bodyMedium?.copyWith(color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
