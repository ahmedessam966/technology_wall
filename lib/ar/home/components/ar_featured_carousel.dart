import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/ar/shared/web/ar_web_notebook_form.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/en/shared/web/web_printer_order_form.dart';
import 'package:technology_wall/core/models/product_model.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class ARFeaturedCarousel extends StatelessWidget {
  const ARFeaturedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InventoryControllers>(context, listen: false);
    return FutureBuilder(
        future: provider.arGetFeaturedProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitCircle(
                color: AppTheme.darkest,
              ),
            );
          } else {
            return FlutterCarousel.builder(
              itemCount: snapshot.data?.length,
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlay: true,
                  height: 70.h,
                  slideIndicator: CircularWaveSlideIndicator(
                      currentIndicatorColor: Colors.black, indicatorBackgroundColor: Colors.grey)),
              itemBuilder: (context, index, _) {
                final product = snapshot.data?[index];
                return GestureDetector(
                  onTap: () async {
                    await showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          switch (product.category) {
                            case 'الحواسب المحمولة':
                              return ARWebNotebookOrderForm(product: product);
                            default:
                              return WebPrinterOrderForm(printer: product);
                          }
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadiusDirectional.circular(5),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [AppTheme.darkest, AppTheme.second, AppTheme.third],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 0),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Builder(builder: (ctx) {
                            switch (product!.category) {
                              case 'الحواسب المكتبية':
                                return Desktop(product: product);
                              case 'الحواسب المحمولة':
                                return Notebook(product: product);
                              default:
                                return Printer(product: product);
                            }
                          }),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: Image.network(
                            product!.snapshot,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}

class Printer extends StatelessWidget {
  final ProductModel product;
  const Printer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabic = ArabicNumbers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          product.title,
          style: context.headlineLarge?.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            SelectableText(
              '• النوع: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.type}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• العائلة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.family}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• سعة الطباعة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${arabic.convert(product.ppm)} ورقة / دقيقة',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• وحدة الشبكة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.network}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الأستخدام الأمثل: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.utility}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الضمان: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SelectableText(
              'السعر الأصلي: ',
              style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
            ),
            SelectableText(
              '${arabic.convert(product.price)} ر.س.',
              style: context.labelSmall?.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  fontSize: 14.sp),
            ),
          ],
        ),
        SelectableText(
          'سعر الخصم: ${arabic.convert(product.maxDiscounted)} ر.س.*',
          style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
        ),
        const Spacer(),
        SelectableText(
          '* العرض ساري حتى: 1 يناير 2024',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
        SelectableText(
          '* السعر غير شامل ضريبة القيمة المضافة',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
      ],
    );
  }
}

class Notebook extends StatelessWidget {
  final ProductModel product;
  const Notebook({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabic = ArabicNumbers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          product.title,
          style: context.headlineLarge?.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            SelectableText(
              '• المعالج: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.processor}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• نظام التشغيل: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.os}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الرسومات: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.graphics}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الشاشة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.display}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الذاكرة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.memory}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• مساحة التخزين: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.storage}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الضمان: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SelectableText(
              'السعر الأصلي: ',
              style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
            ),
            SelectableText(
              '${arabic.convert(product.price)} ر.س.',
              style: context.labelSmall?.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  fontSize: 14.sp),
            ),
          ],
        ),
        SelectableText(
          'سعر الخصم: ${arabic.convert(product.maxDiscounted)} ر.س.*',
          style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
        ),
        const Spacer(),
        SelectableText(
          '* العرض ساري حتى: 1 يناير 2024',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
        SelectableText(
          '* السعر غير شامل ضريبة القيمة المضافة',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
      ],
    );
  }
}

class Desktop extends StatelessWidget {
  final ProductModel product;
  const Desktop({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabic = ArabicNumbers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          product.title,
          style: context.headlineLarge?.copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            SelectableText(
              '• المعالج: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.processor}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• نظام التشغيل: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.os}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الرسومات: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.graphics}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الذاكرة: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.memory}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• مساحة التخزين: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.storage}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        Row(
          children: [
            SelectableText(
              '• الضمان: ',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white),
            ),
            SelectableText(
              '${product.warranty}',
              style: context.labelSmall?.copyWith(fontSize: 12.sp, color: Colors.white70),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SelectableText(
              'السعر الأصلي: ',
              style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
            ),
            SelectableText(
              '${arabic.convert(product.price)} ر.س.',
              style: context.labelSmall?.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  fontSize: 14.sp),
            ),
          ],
        ),
        SelectableText(
          'سعر الخصم: ${arabic.convert(product.maxDiscounted)} ر.س.*',
          style: context.labelSmall?.copyWith(color: Colors.white, fontSize: 14.sp),
        ),
        const Spacer(),
        SelectableText(
          '* العرض ساري حتى: 1 يناير 2024',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
        SelectableText(
          '* السعر غير شامل ضريبة القيمة المضافة',
          style: context.labelSmall?.copyWith(color: Colors.white70, fontSize: 10.sp),
        ),
      ],
    );
  }
}
