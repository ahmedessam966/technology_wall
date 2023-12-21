import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../../shared/web/ar_web_purchase_order.dart';
import '../components/ar_customers_carousel.dart';
import '../components/ar_product_category_card.dart';

class ARWebHomeBody extends StatelessWidget {
  const ARWebHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: true);
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
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        'وسط شامل للخدمات الرقمية',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SelectableText(
                            'خدمات الأجهزة',
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
                      SelectableText(
                        'توريد الأجهزة الأساسية وحتى الخوادم المعقدة',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SelectableText(
                            'خدمات البرمجيات',
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
                      SelectableText(
                        'حلول برمجية مرخصة ومدعومة مطلوبة للأعمال الذكية',
                        style: context.titleMedium?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SelectableText(
                        'وفر الوقت والجهد الثمين. اكتشف خطة الحلول المتكاملة لدينا',
                        style: context.titleSmall?.copyWith(
                            color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
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
                const SizedBox(
                  width: 50,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fserver-back.png?alt=media&token=f6276371-4a7b-4e89-aa7d-2d6799ff5819',
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              'شركاء النجاح',
              style: context.titleMedium?.copyWith(color: const Color(0xaaf7f7f7)),
            ),
          ),
          Container(
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.darkest),
              ),
            ),
            child: const ARCustomersCarousel(),
          ),
          Container(
              color: const Color(0xaaf7f7f7).withOpacity(1),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'منتجاتنا',
                      style: context.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/basics.svg',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'أساسيات مؤسسية',
                        style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
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
                                'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fdesktops.png?alt=media&token=1c5aee7f-01db-4b7d-aba9-41fd4e58ed4b'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      'تبحث عن المزيد؟',
                      style: context.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/ar/hardware');
                      },
                      child: Text(
                        'إستكشف منتاجتنا',
                        style: context.displayLarge?.copyWith(color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/erp.svg',
                          height: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'أساسيات إدارة الموارد',
                          style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/hcc.png',
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      height: 400,
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
                                      height: 120,
                                      width: 150,
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                                      height: 120,
                                      width: 150,
                                    ),
                                  ],
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsage.png?alt=media&token=71be32ed-48c6-4633-b054-de0f42288e93',
                                      height: 100,
                                      width: 120,
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Ftally.png?alt=media&token=cc2a18b7-5796-4ad5-96e6-a5503ed1b65e',
                                      height: 120,
                                      width: 150,
                                    ),
                                  ],
                                )
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
                                  style: context.displayLarge,
                                  textAlign: TextAlign.right,
                                ),
                                Row(
                                  children: [
                                    SelectableText(
                                      'تعرف على المزيد حول اعتمادنا وشراكتنا مع SAP',
                                      style: context.displayLarge,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        'تفاصيل أكثر',
                                        style: context.displayLarge?.copyWith(color: Colors.blue.shade700),
                                      ),
                                    )
                                  ],
                                ),
                                SelectableText(
                                  'تم ترخيص سور التكنولوجيا مباشرة من قبل Sage لإدارة الموارد المؤسساتية لاقتراح وتصميم وتنفيذ حلول Sage لإدارة موارد المؤسسة. بفضل وجود فريق متخصص من خبراء Sage، تقدم سور التكنولوجيا أيضًا خطة دعم تنافسية لما بعد البيع لحلول Sage المنفذة - 24/7',
                                  style: context.displayLarge,
                                  textAlign: TextAlign.right,
                                ),
                                SelectableText(
                                  'يهدف سور التكنولوجيا إلى تقديم خدمة كاملة ومهنية لمتطلبات منطق الأعمال للمؤسسات على اختلاف أحجامها - الصغيرة والمتوسطة والواسعة النطاق. ولخدمة هذا الغرض، تقدم شركة سور التكنولوجيا خدماتها لشركة Tally أنظمة كموزع معتمد.',
                                  style: context.displayLarge,
                                  textAlign: TextAlign.right,
                                ),
                                SelectableText(
                                  'قم بتقييم احتياجات عملك - يمكن تحسين مؤسستك لحلول Sage أو Tally أو SAP. لمزيد من المعلومات حول كيفية تقييم الاستعداد وخطط التسعير، وأي نظام تخطيط موارد المؤسسات (ERP) يناسب متطلبات عملك:',
                                  style: context.displayLarge,
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
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/ar/software/sap');
                                  },
                                  child: Text(
                                    'خدمات ما قبل البيع',
                                    style: context.displayLarge?.copyWith(color: Colors.white70),
                                  ),
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
