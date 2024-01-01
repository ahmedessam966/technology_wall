import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/ar/home/components/ar_featured_carousel.dart';
import 'package:technology_wall/ar/shared/ar_base_rect_button.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';
import '../../../global/controllers/metadata_controllers.dart';
import '../../shared/web/ar_web_purchase_order.dart';
import '../components/ar_customers_carousel.dart';
import '../components/ar_product_category_card.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class ARWebHomeBody extends StatelessWidget {
  const ARWebHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ArabicNumbers arabic = ArabicNumbers();
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'العروض والمنتجات المميزة \n Enterprise Essentials\n ERP Essentials \n بدعم من HCC، شريك حلول SAP المعتمد، يقدم Technology Wall حلول SAP فريدة لأي عمل تجاري. تقديم تنبؤات توقعات مجدية واحترافية، وتحديد النطاق المطلوب لحل تخطيط موارد المؤسسات (ERP)، والتنفيذ ونشر النظام من خلال عمليات CI/CD المخصصة للعميل، وعقد صيانة سنوي اختياري ينفذه مستشارو SAP الخبراء المعتمدون لدينا. \n تم ترخيص Technology Wall مباشرة من قبل Sage ERP System Corporation لاقتراح وتصميم وتنفيذ حلول Sage ERP. بوجود فريق متخصص من خبراء Sage Solutions، تقدم Technology Wall أيضًا خطة دعم تنافسية لما بعد البيع لحلول Sage المنفذة - 24/7.  n يهدف Technology Wall إلى تلبية متطلبات منطق الأعمال للمؤسسات على اختلاف مستوياتها - الصغيرة والمتوسطة والواسعة النطاق بشكل كامل ومهني. ولخدمة هذا الغرض، تقدم شركة Technology Wall خدماتها لشركة Tally Solutions كموزع معتمد.',
        'ar');
    final provider = Provider.of<AppControllers>(context, listen: true);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SelectableText(
                        'انظمة متكاملة - سهلة ويٌعتمد عليها',
                        style: context.titleLarge?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SelectableText(
                        'وسط شامل للخدمات الرقمية',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          SelectableText(
                            'خدمات الأجهزة',
                            style:
                                context.displayLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      SelectableText(
                        'توريد الأجهزة الأساسية وحتى الخوادم المعقدة',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SelectableText(
                            'خدمات البرمجيات',
                            style:
                                context.displayLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Color(0xaaffffff),
                          ),
                        ],
                      ),
                      SelectableText(
                        'حلول برمجية مرخصة ومدعومة مطلوبة للأعمال الذكية',
                        style: context.titleMedium?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SelectableText(
                        'وفر الوقت والجهد الثمين. اكتشف خطة الحلول المتكاملة لدينا',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
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
                                return const ARWebPurchaseOrder();
                              });
                        },
                        child: Text(
                          'انشاء طلب شراء',
                          style: context.displayLarge?.copyWith(
                              color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fserver-back.png?alt=media&token=f6276371-4a7b-4e89-aa7d-2d6799ff5819',
                  height: 35.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              'شركاء النجاح',
              style: context.titleMedium?.copyWith(color: const Color(0xaaf7f7f7)),
            ),
          ),
          Container(
            height: 20.h,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.darkest),
              ),
            ),
            child: const ARCustomersCarousel(),
          ),
          Container(
              color: const Color(0xaaf7f7f7).withOpacity(1),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('العروض والمنتجات المميزة',
                        style:
                            context.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 90.h,
                    child: const ARFeaturedCarousel(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      'إستكشف منتاجتنا',
                      style: context.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/basics.svg',
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'أساسيات مؤسسية',
                        style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
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
                        child: ARProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Printers');
                              Navigator.pushNamed(context, '/ar/hardware/printers');
                            },
                            category: 'الطابعات',
                            description:
                                'مجموعة واسعة من الطابعات والماسحات الضوئية وأجهزة الراسمة وغير ذلك الكثير للأعمال أو الأغراض الشخصية',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fprinters.png?alt=media&token=204e41e8-caf1-4683-9834-1d39c76b465f'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ARProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Notebooks');
                              Navigator.pushNamed(context, '/ar/hardware/notebooks');
                            },
                            category: 'الأجهزة المحمولة',
                            description: 'مجموعات احترافية ومضمونة وعصرية - دائمًا',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flaptops.png?alt=media&token=d70f1ad2-cb33-4f0c-9e43-9c028c7b4b4a'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ARProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Servers');
                              Navigator.pushNamed(context, '/ar/hardware/servers');
                            },
                            category: 'الخوادم',
                            description: 'خوادم حديثة مصممة خصيصًا لتلبية احتياجات مؤسستك المطلوبة',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fservers.png?alt=media&token=375a0f05-a830-41df-9db0-6731850b95fd'),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: ARProductCategoryCard(
                            onPressed: () {
                              provider.changePage('Technology Wall | Desktop PC');
                              Navigator.pushNamed(context, '/ar/hardware/desktops');
                            },
                            category: 'الأجهزة المكتبية',
                            description:
                                'حجر الأساس في إدارة المؤسسات الرقمية بالكامل، مع أدوات مساعدة متنوعة وفعالية من حيث التكلفة',
                            imagePath:
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fimac.webp?alt=media&token=b2f1e6e9-8666-4a5f-87d3-bc61dd946663'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      'تبحث عن المزيد؟',
                      style: context.displayLarge,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: ARBaseRectButton(
                      title: 'استشكف منتاجتنا',
                      action: () {
                        Navigator.pushNamed(context, 'ar/hardware');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Divider(
                    indent: 3.w,
                    endIndent: 3.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/erp.svg',
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'أساسيات إدارة الموارد',
                          style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/hcc.png',
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: SizedBox(
                      height: 60.h,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fs4hana.png?alt=media&token=79b3e395-e676-4d2b-b36f-cb9b746281c2',
                                      height: 12.h,
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                                      height: 12.h,
                                    ),
                                  ],
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                                      height: 10.h,
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                                      height: 12.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText(
                                  'بدعم من HCC، شريك حلول SAP المعتمد، يقدم سور التكنولوجيا حلول SAP فريدة لأي عمل تجاري. تقديم توقعات مجدية واحترافية، وتحديد النطاق المطلوب لحل تخطيط موارد المؤسسات (ERP)، والتنفيذ ونشر النظام من خلال عمليات عمليات التكوير والتكامل المٌستدام المخصصة للعميل، وعقد صيانة سنوي اختياري ينفذه مستشارو SAP الخبراء المعتمدون لدينا.',
                                  style: context.labelSmall?.copyWith(fontSize: 13.sp),
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  children: [
                                    SelectableText(
                                      'تعرف على المزيد حول اعتمادنا وشراكتنا مع SAP',
                                      style: context.labelSmall?.copyWith(fontSize: 13.sp),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: Text('تفاصيل أكثر',
                                          style: context.labelSmall?.copyWith(
                                            fontSize: 13.sp,
                                            color: Colors.blue.shade700,
                                          )),
                                    )
                                  ],
                                ),
                                SelectableText(
                                  'تم ترخيص سور التكنولوجيا مباشرة من قبل Sage لإدارة الموارد المؤسساتية لاقتراح وتصميم وتنفيذ حلول Sage لإدارة موارد المؤسسة. بفضل وجود فريق متخصص من خبراء Sage، تقدم سور التكنولوجيا أيضًا خطة دعم تنافسية لما بعد البيع لحلول Sage المنفذة - ${arabic.convert(24)} ساعة على مدار الأسبوع',
                                  style: context.labelSmall?.copyWith(fontSize: 13.sp),
                                  textAlign: TextAlign.right,
                                ),
                                SelectableText(
                                  'يهدف سور التكنولوجيا إلى تقديم خدمة كاملة ومهنية لمتطلبات منطق الأعمال للمؤسسات على اختلاف أحجامها - الصغيرة والمتوسطة والواسعة النطاق. ولخدمة هذا الغرض، تقدم شركة سور التكنولوجيا خدماتها لشركة Tally أنظمة كموزع معتمد.',
                                  style: context.labelSmall?.copyWith(fontSize: 13.sp),
                                  textAlign: TextAlign.right,
                                ),
                                SelectableText(
                                  'قم بتقييم احتياجات عملك - يمكن تحسين مؤسستك لحلول Sage أو Tally أو SAP. لمزيد من المعلومات حول كيفية تقييم الاستعداد وخطط التسعير، وأي نظام تخطيط موارد المؤسسات (ERP) يناسب متطلبات عملك:',
                                  style: context.labelSmall?.copyWith(fontSize: 13.sp),
                                ),
                                ARBaseRectButton(
                                  title: 'خدمات ما قبل البيع',
                                  action: () {
                                    Navigator.pushNamed(context, 'ar/software/sap');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ]);
  }
}
