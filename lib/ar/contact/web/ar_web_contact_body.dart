// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'dart:html' as html;
import '../../../core/controllers/metadata_controllers.dart';

class ARWebContactBody extends StatelessWidget {
  const ARWebContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    final MetadataControllers metadataFunctions = MetadataControllers();
    metadataFunctions.injectPageSpecificContent(
        'عنوان البريد الألكتروني: info@techwall.com.sa - هاتف التواصل: 00966542575808 - صفحة الفيسبوك: https://facebook.com/techwall.sa - العنوان: مكتب 27, مبنى 233, شارع جرير, سوق العليا للحاسب الآلي, 12211 الرياض, المملكة العربية السعودية',
        'ar');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideInUp(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: 45.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'سور التكنولوجيا',
                  style: context.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                ),
                Text(
                  'تواصل معنا',
                  style: context.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 50),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xaaf1f1f1).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppTheme.second.withOpacity(1),
                    AppTheme.third.withOpacity(1),
                  ]),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تواصل معنا',
                            style: context.titleSmall?.copyWith(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            'يسعدنا أن نسمع منك',
                            style: context.titleMedium
                                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            'نحن نقدر دائما ملاحظاتك وآرائك. يمكنك الاتصال بنا عبر معلومات الاتصال المذكورة هنا، أو عن طريق ملء نموذج الاتصال وسنتواصل معك! يمكنك أيضًا مراجعة قسم الأسئلة الشائعة في هذه الصفحة للحصول على المساعدة بشكل أسرع.',
                            style: context.displayLarge?.copyWith(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            'املأ النموذج وسنتأكد من الاتصال بك بخصوص أسئلتك أو اقتراحاتك في أقرب وقت ممكن.',
                            style: context.displayLarge?.copyWith(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Divider(
                            indent: 3.w,
                            endIndent: 3.w,
                            color: Colors.white60,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'يمكنك أيضًا التواصل معنا عبر',
                            style: context.titleSmall?.copyWith(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            children: [
                              const Icon(CupertinoIcons.phone_down_fill, color: Colors.white),
                              SizedBox(width: 1.w),
                              Text('+۹٦٦٥٤۲٥۷٥۸۰۸',
                                  textDirection: TextDirection.ltr,
                                  style: context.bodyLarge?.copyWith(color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            children: [
                              const Icon(CupertinoIcons.mail_solid, color: Colors.white),
                              SizedBox(width: 1.w),
                              Text('info@techwall.com.sa',
                                  style: context.bodyLarge?.copyWith(color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    html.window.open('https://facebook.com/techwall.sa', '_about:blank');
                                  },
                                  child: SvgPicture.asset('assets/icons/facebook.svg')),
                              SizedBox(width: 2.w),
                              SvgPicture.asset('assets/icons/instagram.svg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              shape: const LinearBorder(),
                              margin: EdgeInsets.zero,
                              color: const Color(0xaaf7f7f7).withOpacity(1),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
                                child: Form(
                                  child: Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          floatingLabelStyle: context.bodyLarge,
                                          label: Text('الأسم الكامل', style: context.displayMedium),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          floatingLabelStyle: context.bodyLarge,
                                          label: Text('البريد الألكتروني', style: context.displayMedium),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          floatingLabelStyle: context.bodyLarge,
                                          label: Text('رقم الجوال', style: context.displayMedium),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      DropdownButtonFormField(
                                          style: context.bodyLarge,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            floatingLabelStyle: context.bodyLarge,
                                            label: Text('الموضوع', style: context.displayMedium),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(1),
                                              borderSide: const BorderSide(color: Colors.black54),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(1),
                                              borderSide: const BorderSide(color: Colors.black54),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(1),
                                              borderSide: const BorderSide(color: Colors.black54),
                                            ),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              value: 'إستفسار عام',
                                              child: Text('إستفسار عام', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'المشتريات',
                                              child: Text('المشتريات', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'المستردات',
                                              child: Text('المستردات', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'الضمان',
                                              child: Text('الضمان', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'خدمات ما بعد البيع',
                                              child: Text('خدمات ما بعد البيع', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'خدمات ما قبل البيع',
                                              child: Text('خدمات ما قبل البيع', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'تعليق',
                                              child: Text('تعليق', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'شكوى',
                                              child: Text('شكوى', style: context.displayMedium),
                                            ),
                                            DropdownMenuItem(
                                              value: 'اخرى',
                                              child: Text('اخرى', style: context.displayMedium),
                                            ),
                                          ],
                                          onChanged: (newValue) {}),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      TextField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          floatingLabelStyle: context.bodyLarge,
                                          label: Text('رسالتك', style: context.displayMedium),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(1),
                                            borderSide: const BorderSide(color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const LinearBorder(), foregroundColor: Colors.black),
                                          onPressed: () {},
                                          child: Text('ارسل', style: context.displayMedium),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Text('تعرف على المزيد حول كيفية معالجتنا لمعلوماتك الشخصية ',
                                    style: context.displayMedium?.copyWith(color: Colors.white70)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/privacy');
                                  },
                                  child: Text('مركز الخصوصية',
                                      style: context.displayMedium?.copyWith(color: Colors.white)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'الأسئلة والأجوبة المتداولة',
                  style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SelectableText(
                'س: لقد مر أكثر من ٣ أيام منذ أن طلبت الاتصال ولم أتلق أي شيء من جانبكم.',
                style: context.titleSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: EdgeInsets.all(10.px),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: SelectableText(
                      'ج: نعتذر عن أي إزعاج ونقدر دائمًا تفاعلات عملائنا. إذا مرت ٣ أيام عمل، فننصحك بالتحقق من مجلد الرسائل غير المرغوب فيها/البريد العشوائي بحثًا عن أي رسائل بريد إلكتروني من "Technology Wall". إذا لم تتلق بريدًا إلكترونيًا بعد، فيرجى تقديم طلب اتصال آخر أو الاتصال بنا مباشرة على الرقم ٠٠٩٦٦٥٤٢٥٧٥٨٠٨.',
                      style: context.labelSmall?.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SelectableText(
                'س: متى يمكنني أن أتوقع معاودة الاتصال أو الرد بخصوص شكواي/استرداد المبالغ؟',
                style: context.titleSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: EdgeInsets.all(10.px),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: SelectableText(
                      'ج: نحن نسعى جاهدين لتقديم خدمات استثنائية لعملائنا الكرام، ونحن نقدر ملاحظاتك. ومع ذلك، إذا كنت قد قدمت بالفعل شكوى أو طلبًا لاسترداد أي مبالغ، فيجب أن تتلقى ردًا منا خلال ٣-٥ أيام عمل.',
                      style: context.labelSmall?.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SelectableText(
                'س: هل تقدم سور التكنولوجيا خدمات الصيانة؟',
                style: context.titleSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: EdgeInsets.all(10.px),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: SelectableText(
                      'ج: نعم نفعل. يوظف لدى سور التكنولوجيا عددًا كبيرًا من فنيي ومهندسي الصيانة ذوي الخبرة الذين سيكونون أكثر من سعداء بمساعدتك في صيانة أجهزة الكمبيوتر المكتبية وأجهزة الكمبيوتر المحمولة والطابعات والخوادم وكل الأجهزة الأخرى تقريبًا، سواء تم شراؤها من خلالنا أو من أي مكان آخر. .',
                      style: context.labelSmall?.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SelectableText(
                'س: هل يمكنني الاحتفاظ بالتراخيص ومفاتيح الترخيص الخاصة بمنتجات البرامج عند إجراء عملية شراء؟',
                style: context.titleSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: EdgeInsets.all(10.px),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: SelectableText(
                      'ج: بكل تأكيد نعم. بمجرد إتمام عملية الشراء، فهذا يعني أنك مالك ترخيص المنتج، وبالتالي أصبح تحت تصرفك. ومع ذلك، لا يمكن تنفيذ بعض البرامج وتثبيتها إلا بواسطة متخصص معتمد، على الرغم من إمتلاكك ترخيصها، كما هو الحال مع SAP ERP Solutions، على سبيل المثال، حيث تتطلب هذه التراخيص مزيدًا من عمليات التحقق من كل من SAP و موزع SAP المعتمد',
                      style: context.labelSmall?.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
