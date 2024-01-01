import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../global/controllers/metadata_controllers.dart';

class ARWebAccreditationBody extends StatelessWidget {
  const ARWebAccreditationBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'صفحة الأعتمادات\n إعتمادات SAP \n تعرف على المزيد حول شراكتنا مع شركة HCC الشرق الأوسط لتوريد وتنفيذ حلول SAP Business One ERP. \n لضمان الجودة الموثوقة والأداء التنافسي، سعت شركة سور التكنولوجيا إلى أن تكون مشغلًا معتمدًا لحلول SAP Business One ERP في المملكة العربية السعودية. بدعم من شركة HCC الشرق الأوسط، وهي مزود SAP Soultions المعتمد في دبي، الإمارات العربية المتحدة، أتاحت Technology Wall تقديم خدمات واستشارات تنفيذ SAP Excelsior. \n إثراء السوق بشراكات قوية. \n كجزء من رؤيتنا، تلتزم Technology Wall بتوفير جودة خدمة عالية المستوى بغض النظر عن المهمة المطلوبة. كل عميل له نفس قيمة العميل التالي. في Technology Wall، نسعى بلا هوادة إلى توفير أماكن إقامة مرنة لتلبية جميع متطلبات العمل. نحن نفهم القيمة، ولهذا السبب يتم دائمًا تدقيق عملياتنا وفقًا لمعايير الجودة الدولية التي تعود بالنفع في نهاية المطاف على شركائنا الاستراتيجيين والشركاء المحتملين والمحتملين وعملائنا.',
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
                Center(
                  child: Text(
                    'تعرف على',
                    style: context.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 24.sp),
                  ),
                ),
                Center(
                  child: Text(
                    'سور التكنولوجيا',
                    style: context.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 22.sp),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                    height: 9.h,
                  ),
                  Image.asset(
                    'assets/images/hcc.png',
                    height: 9.h,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                    height: 11.h,
                  ),
                ],
              ),
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
                          'إثراء السوق بشراكات قوية',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'لضمان الجودة الموثوقة والأداء التنافسي، سعت شركة سور التكنولوجيا إلى أن تكون مشغلًا معتمدًا لحلول SAP Business One ERP في المملكة العربية السعودية. بدعم من شركة HCC الشرق الأوسط للأستشارات، وهي شركة معتمدة لحلول SAP في دبي، الإمارات العربية المتحدة، أتاحت سور التكنولوجيا تقديم خدمات واستشارات تنفيذ SAP بشكل ممتاز.',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 45.h,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/partner.jpg'), fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, offset: Offset(5, 5), blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                ],
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
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Text(
                          'مورد منتجات مايكروسوفت للأفراد والأعمال',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'في سور التكنولوجيا، ندرك ضرورة مواكبة تقنيات البرمجيات المتطورة دائمًا. ولذلك نعلم مدى اهمية منتجات مياكروسوفت للأستخدامات اليومية الفردية بالإضافة إلى سهولة وشمولية الأستخدامات التي تقدمها للشركات. توفر شركة سور التكنولوجيا جميع منتجات مايكروسوفت المرخصة والأصلية، للأفراد والمؤسسات.',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/images/software.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
