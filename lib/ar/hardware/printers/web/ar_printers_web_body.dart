import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../global/controllers/metadata_controllers.dart';
import '../../../shared/web/ar_cart_widget.dart';
import '../../../shared/web/ar_web_purchase_order.dart';
import '../components/ar_printers_builder_widget.dart';
import '../components/ar_refined_printers_builder_widget.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../global/controllers/cart_controllers.dart';
import '../controllers/ar_printers_controllers.dart';

class ARWebHardwareBody extends StatelessWidget {
  const ARWebHardwareBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'استكشف أو ابحث عن الطابعة التي تريدها. استكشف أنواع الطابعات المتوفرة: طابعة ليزر ملونة، وطابعة نقطية، وطابعة أحادية اللون، وطابعة مكتبية، وأدوات مكتبية للخدمة الشاقة، وطابعات الشبكة، ونماذج الطابعات المتكاملة. العلامات التجارية المضمونة. طابعات HP وCanon وEpson وZebra.',
        'en');
    return Consumer<ARPrintersControllers>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'متجر متكامل لجميع أغراض الطباعة',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'للأستخدام الشخصي',
                            style:
                                context.displayLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'توريد الأجهزة الأساسية وحتى الخوادم المعقدة.',
                        style: context.displayLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'لإستخدامات الأعمال',
                            style:
                                context.displayLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      Text(
                        'حلول برمجية مرخصة ومدعومة مطلوبة لذكاء الأعمال',
                        style: context.displayLarge?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'وفر الوقت والجهد الثمين. اكتشف خطة الحلول المتكاملة لدينا.',
                        style: context.titleSmall?.copyWith(color: const Color(0xaaaaaeb6).withOpacity(1)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f',
                  height: 250,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: Colors.white70,
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fcanon.png?alt=media&token=13879247-d407-4014-be47-02560b767f08',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fhp.png?alt=media&token=93888802-9693-4f3f-a63f-50806af7c184',
                  color: Colors.white70,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ffujitsu.png?alt=media&token=43a14824-0814-41f1-9c2e-2ce084b22bdd',
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            color: const Color(0xaaf7f7f7).withOpacity(1),
            height: provider.arPrinterFilterSelection != null && provider.arPrinterFilterSelection!.isNotEmpty
                ? 1100
                : 1600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'الطابعات والماسحات الضوئية',
                    style: context.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'مجموعة متنوعة من الطابعات والماسحات الضوئية متعددة الأغراض المناسبة للاستخدام التجاري والشخصي',
                    style: context.displayLarge,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchBar(
                      controller: provider.arPrinterSearchController,
                      trailing: [
                        Text(
                          'البحث حسب العلامة التجارية',
                          style: context.displayMedium,
                        ),
                        Checkbox.adaptive(
                            value: provider.searchByBrand,
                            onChanged: (newValue) {
                              provider.searchType();
                            }),
                      ],
                      hintText: 'البحث حسب العلامة التجارية أو الموديل',
                      hintStyle: MaterialStatePropertyAll(context.displayMedium),
                      onSubmitted: (value) {
                        provider.arSetPrinterSearchController(value);
                      },
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    DropdownButton(
                        underline: const SizedBox.shrink(),
                        style: context.bodyLarge,
                        hint: Text(
                          'عرض بالعلامة التجارية',
                          style: context.displayMedium,
                        ),
                        value: provider.arPrinterFilterSelection,
                        borderRadius: BorderRadius.circular(10),
                        items: const [
                          DropdownMenuItem(
                            value: 'الكل',
                            child: Text('الكل'),
                          ),
                          DropdownMenuItem(
                            value: 'HP',
                            child: Text('HP'),
                          ),
                          DropdownMenuItem(
                            value: 'Canon',
                            child: Text('Canon'),
                          ),
                          DropdownMenuItem(
                            value: 'Fujitsu',
                            child: Text('Fujitsu'),
                          ),
                        ],
                        onChanged: (newValue) {
                          if (newValue != null && newValue != 'الكل') {
                            provider.arSetFilter(newValue);
                          }
                          if (newValue == 'الكل') {
                            provider.arSetFilter(null);
                          }
                        }),
                    ElevatedButton(
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
                      onPressed: () async {
                        await showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return const ARCartWidget();
                            });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white70,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'السلة (${Provider.of<CartControllers>(context, listen: true).cart.keys.length})',
                            style: context.displayMedium?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child:
                      provider.arPrinterFilterSelection == null || provider.arPrinterFilterSelection == 'الكل'
                          ? const PrintersBuilderWidget()
                          : const RefinedPrintersBuilderWidget(),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent;
                        } else {
                          return Colors.grey.shade100;
                        }
                      }),
                      shape: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered)) {
                          return LinearBorder.bottom(side: const BorderSide(color: Colors.black));
                        } else {
                          return null;
                        }
                      }),
                    ),
                    onPressed: provider.isLoading
                        ? null
                        : () async {
                            provider.setLoading();
                            await provider.loadMoreItems();
                            provider.setLoading();
                          },
                    child: Text(
                      'إظهار المزيد',
                      style: context.displayMedium?.copyWith(color: AppTheme.darkest),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    'لم تتمكن من العثور على المنتج الخاص بك؟ أرسل نموذج الطلب وسنجده لك',
                    style: context.displayMedium,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
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
                    onPressed: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const ARWebPurchaseOrder();
                          });
                    },
                    child: Text(
                      'إنشاء الطلب',
                      style: context.displayMedium?.copyWith(color: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
