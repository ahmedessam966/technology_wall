import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../core/controllers/metadata_controllers.dart';

class ARWebAboutBody extends StatelessWidget {
  const ARWebAboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'عن الشركة\n  اكتشف ما يحرك سور التكنولوجيا. دوافعنا ورؤيتنا وأهدافنا. \n بداية سور التكنولوجيا؛ كيف بدأت. \n أسسها مهيب مرغيلاني، المدير العام لسور التكنولوجيا، وعصام الدين أحمد، المدير الإقليمي لسور التكنولوجيا في منطقة الشرق الأوسط وشمال أفريقيا، وتعود أصول سور التكنولوجيا إلى عام 2000، والتي تحولت بعد ذلك لتأسيس كيان رائد في هذا المجال. للتكنولوجيا ونظم المعلومات. حافظت شركة سور التكنولوجيا على استراتيجيات توسع مستدامة وممكنة سمحت بنمو الكيان على مدار الـ 23 عامًا الماضية، مما يوفر خدمات عالية الجودة لا مثيل لها لأكثر من 50 عميلًا. \n يهدف سور التكنولوجيا إلى أن يكون مساهمًا رئيسيًا في مبادرة الرقمنة في المملكة العربية السعودية. \n تماشياً مع رؤية المملكة العربية السعودية لعام 2030، نهدف إلى المساهمة في تطوير البنية التحتية الرقمية؛ إن مواكبة التطورات في مجال التكنولوجيا هي إحدى أولوياتنا القصوى. يسعى سور التكنولوجيا إلى تحقيق رضا العملاء وتقديم خدمات شاملة نابعة من فلسفتنا المتمثلة في وضع العميل في المقام الأول.',
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: Text(
                      'تعرف على',
                      style: context.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 28.sp),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'سور الكنولوجيا',
                    style: context.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Center(
                    child: Text(
                      'عن الشركة',
                      style: context.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'بداية سور التكنولوجيا - كيف بدأت.',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'أسسها مُحب مرغيلاني، المدير العام لسور التكنولوجيا، وعصام الدين أحمد، المدير الإقليمي لسور التكنولوجيا في منطقة الشرق الأوسط وشمال أفريقيا، وتعود أصول سور التكنولوجيا إلى عام ٢٠٠٠، والتي تحولت بعد ذلك لتأسيس كيان رائد في مجال التكنولوجيا. ونظم المعلومات. حافظت شركة سور الكنولوجيا على استراتيجيات توسع مستدامة وممكنة سمحت بنمو الكيان على مدار الـ ٢٣ عامًا الماضية، مما يوفر خدمات عالية الجودة لا مثيل لها لأكثر من ٥٠ عميلًا.',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.grey),
                                boxShadow: const [
                                  BoxShadow(offset: Offset(0, 0), color: Colors.black45, blurRadius: 3),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 90.px,
                                backgroundImage: const AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 3, color: Colors.grey),
                                boxShadow: const [
                                  BoxShadow(offset: Offset(0, 0), color: Colors.black45, blurRadius: 3),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 90.px,
                                backgroundImage: const AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(10.px),
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/initiative.webp'), fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, offset: Offset(-5, -5), blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'تهدف سور التكنولوجيا إلى مساهمةً رئيسيةٍ لمبادرة الرقمنة في المملكة.',
                          overflow: TextOverflow.clip,
                          style: context.titleSmall?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'تماشياً مع رؤية المملكة العربية السعودية لعام ٢٠٣٠	، نهدف إلى المساهمة في تطوير البنية التحتية الرقمية؛ إن مواكبة التطورات في مجال التكنولوجيا هي إحدى أولوياتنا القصوى. تسعى سور التكنولوجيا إلى تحقيق رضا العملاء وتقديم خدمات شاملة نابعة من فلسفتنا المتمثلة في وضع العميل في المقام الأول.',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  'كجزء من رؤيتنا، تلتزم سور التكنولوجيا بتوفير جودة خدمة عالية المستوى بغض النظر عن المهمة المطلوبة. كل عميل له نفس قيمة العميل التالي. في سور التكنولوجيا، نسعى بلا هوادة إلى توفير أماكن إقامة مرنة لتلبية جميع متطلبات العمل. نحن نفهم القيمة، ولهذا السبب يتم دائمًا تدقيق عملياتنا وفقًا لمعايير الجودة الدولية التي تعود بالنفع في نهاية المطاف على شركائنا الاستراتيجيين والشركاء المحتملين والمحتملين وعملائنا.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: context.titleSmall,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                indent: 3.w,
                endIndent: 3.w,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'قيادتنا',
                  style: context.titleLarge,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 100.px,
                          backgroundImage: const AssetImage('assets/images/essam.png'),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'عصام الدين احمد',
                          style: context.titleMedium,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'المدير الأقليمي للشرق الأوسط',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 100.px,
                          backgroundImage: const AssetImage('assets/images/essam.png'),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'مُحب مرغيلاني',
                          style: context.titleMedium,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'المدير العام',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
