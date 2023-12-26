import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../../core/controllers/metadata_controllers.dart';

class ARWebAccreditationBody extends StatelessWidget {
  const ARWebAccreditationBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'صفحة الأعتمادات\n إعتمادات SAP \n تعرف على المزيد حول شراكتنا مع شركة HCC الشرق الأوسط لتوريد وتنفيذ حلول SAP Business One ERP. \n لضمان الجودة الموثوقة والأداء التنافسي، سعت شركة جدار التكنولوجيا إلى أن تكون مشغلًا معتمدًا لحلول SAP Business One ERP في المملكة العربية السعودية. بدعم من شركة HCC الشرق الأوسط، وهي مزود SAP Soultions المعتمد في دبي، الإمارات العربية المتحدة، أتاحت Technology Wall تقديم خدمات واستشارات تنفيذ SAP Excelsior. \n إثراء السوق بشراكات قوية. \n كجزء من رؤيتنا، تلتزم Technology Wall بتوفير جودة خدمة عالية المستوى بغض النظر عن المهمة المطلوبة. كل عميل له نفس قيمة العميل التالي. في Technology Wall، نسعى بلا هوادة إلى توفير أماكن إقامة مرنة لتلبية جميع متطلبات العمل. نحن نفهم القيمة، ولهذا السبب يتم دائمًا تدقيق عملياتنا وفقًا لمعايير الجودة الدولية التي تعود بالنفع في نهاية المطاف على شركائنا الاستراتيجيين والشركاء المحتملين والمحتملين وعملائنا.',
        'ar');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SlideInUp(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset(
                    'assets/icons/qqquad.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                      child: Center(
                        child: Text(
                          'تعرف على',
                          style: context.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'سور التكنولوجيا',
                          style: context.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xaaf7f7f7).withOpacity(1),
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap.png?alt=media&token=13ea2871-e588-48ea-a230-8d37d9d79db3',
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/hcc.png',
                    height: 80,
                  ),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsone.png?alt=media&token=bf4eb120-1472-410c-8d21-c43f587d98cd',
                    height: 100,
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
                    child: Column(
                      children: [
                        Text(
                          'إثراء السوق بشراكات قوية',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'لضمان الجودة الموثوقة والأداء التنافسي، سعت شركة جدار التكنولوجيا إلى أن تكون مشغلًا معتمدًا لحلول SAP Business One ERP في المملكة العربية السعودية. بدعم من شركة HCC الشرق الأوسط للأستشارات، وهي شركة معتمدة لحلول SAP في دبي، الإمارات العربية المتحدة، أتاحت سور التكنولوجيا تقديم خدمات واستشارات تنفيذ SAP بشكل ممتاز.',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 400,
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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'كجزء من رؤيتنا، تلتزم سور التكنولوجيا بتوفير جودة خدمة عالية المستوى بغض النظر عن المهمة المطلوبة. كل عميل له نفس قيمة العميل التالي. في سور التكنولوجيا، نسعى بلا هوادة إلى توفير أماكن إقامة مرنة لتلبية جميع متطلبات العمل. نحن نفهم القيمة، ولهذا السبب يتم دائمًا تدقيق عملياتنا وفقًا لمعايير الجودة الدولية التي تعود بالنفع في نهاية المطاف على شركائنا الاستراتيجيين والشركاء المحتملين والمحتملين وعملائنا.',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: context.titleSmall,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'قيادتنا',
                  style: context.titleLarge,
                ),
              ),
              const SizedBox(
                height: 50,
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
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/images/essam.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'عصام الدين أحمد',
                          style: context.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'المدير الأقليمي للشرق الأوسط وشمال إفريقيا',
                          style: context.titleSmall,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/images/essam.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'مُحب الله مرغلاني',
                          style: context.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'المدير العام لسور التكنولوجيا',
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
