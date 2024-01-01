import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/cart_controllers.dart';
import 'package:technology_wall/core/models/product_model.dart';
import 'package:technology_wall/en/shared/base_rect_button.dart';
import '../../../../config/themes/app_theme.dart';

class ARDesktopCardWidget extends StatelessWidget {
  final ProductModel desktop;
  const ARDesktopCardWidget({super.key, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.px),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.px),
        border: Border.all(color: Colors.black87),
        color: Colors.white38,
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: Image.network(
                desktop.snapshot,
                width: 25.w,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Center(
              child: SelectableText(
                desktop.title,
                style: context.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  '• المعالج: ${desktop.processor}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• نظام التشغيل: ${desktop.os}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• الرسومات: ${desktop.graphics}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• الذاكرة: ${desktop.memory}',
                  style: context.bodyLarge,
                ),
                SelectableText(
                  '• التخزين: ${desktop.storage}',
                  style: context.bodyLarge,
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 4,
                  child: BaseRectButton(
                    title: 'اطلب الأن',
                    action: () async {
                      // await showAdaptiveDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return WebNotebookOrderForm(
                      //         item: desktop,
                      //       );
                      //     });
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: Builder(builder: (context) {
                    final cart = Provider.of<CartControllers>(context, listen: true);
                    return ElevatedButton(
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
                            return const Color(0xaa1a374d).withOpacity(1);
                          }
                        }),
                      ),
                      onPressed: () {
                        cart.cart.containsKey(desktop.id)
                            ? cart.removeFromCart(desktop.id)
                            : cart.addToCart(desktop);
                      },
                      child: cart.cart.containsKey(desktop.id)
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  'مضاف',
                                  style: context.bodyLarge?.copyWith(color: Colors.white70),
                                ),
                              ],
                            )
                          : Text(
                              'اضف للسلة',
                              style: context.bodyLarge?.copyWith(color: Colors.white70),
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  LinearBorder.bottom(side: const BorderSide(color: AppTheme.darkest)),
                ),
              ),
              onPressed: () {},
              child: Text(
                'جميع الأمكانيات',
                style: context.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}