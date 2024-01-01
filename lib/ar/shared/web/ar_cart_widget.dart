import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/global/controllers/cart_controllers.dart';

class ARCartWidget extends StatelessWidget {
  const ARCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartControllers>(builder: (context, provider, _) {
      return Dialog(
        backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
        surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: const Color(0xaaf7f7f7).withOpacity(1),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Cart',
                      style: context.headlineSmall,
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
              ),
              SizedBox(
                height: provider.cart.isEmpty ? 300 : 50,
              ),
              provider.cart.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : SizedBox(
                      height: 380,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: provider.cart.keys.length,
                        itemBuilder: (context, index) {
                          String key = provider.cart.keys.elementAt(index);
                          final item = provider.cart[key];
                          return ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.black)),
                            title: Text(item.title),
                            subtitle: Text(item.brand),
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
                      color: const Color(0xaaf7f7f7).withOpacity(1),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                      child: Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
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
