import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../../core/controllers/metadata_controllers.dart';

class ARWebAboutBody extends StatelessWidget {
  const ARWebAboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'عن الشركة\n  اكتشف ما يحرك سور التكنولوجيا. دوافعنا ورؤيتنا وأهدافنا. \n بداية سةر التكنولوجيا؛ كيف بدأت. \n أسسها مهيب مرغيلاني، المدير العام لسور التكنولوجيا، وعصام الدين أحمد، المدير الإقليمي لسور التكنولوجيا في منطقة الشرق الأوسط وشمال أفريقيا، وتعود أصول سور التكنولوجيا إلى عام 2000، والتي تحولت بعد ذلك لتأسيس كيان رائد في هذا المجال. للتكنولوجيا ونظم المعلومات. حافظت شركة سور التكنولوجيا على استراتيجيات توسع مستدامة وممكنة سمحت بنمو الكيان على مدار الـ 23 عامًا الماضية، مما يوفر خدمات عالية الجودة لا مثيل لها لأكثر من 50 عميلًا. \n يهدف سور التكنولوجيا إلى أن يكون مساهمًا رئيسيًا في مبادرة الرقمنة في المملكة العربية السعودية. \n تماشياً مع رؤية المملكة العربية السعودية لعام 2030، نهدف إلى المساهمة في تطوير البنية التحتية الرقمية؛ إن مواكبة التطورات في مجال التكنولوجيا هي إحدى أولوياتنا القصوى. يسعى سور التكنولوجيا إلى تحقيق رضا العملاء وتقديم خدمات شاملة نابعة من فلسفتنا المتمثلة في وضع العميل في المقام الأول.',
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
                          'سور الكنولوجيا',
                          style: context.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 50),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'عن الشركة',
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
                          'بداية سور التكنولوجيا؛ كيف بدأت.',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
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
                      height: 400,
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
                              child: const CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage('assets/images/essam.png'),
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
                              child: const CircleAvatar(
                                radius: 90,
                                backgroundImage: AssetImage('assets/images/essam.png'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 450,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black45),
                        borderRadius: const BorderRadius.all(Radius.zero),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/aspire.webp'), fit: BoxFit.cover),
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
                          'تهدف سور التكنولوجيا إلى أن تكون مساهمًا رئيسيًا في مبادرة الرقمنة في المملكة العربية السعودية.',
                          overflow: TextOverflow.clip,
                          style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 60),
                        ),
                        const SizedBox(
                          height: 20,
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
                  'Our Leadership',
                  style: context.headlineLarge,
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
                          'Essameldin Ahmed',
                          style: context.headlineMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Technology Wall Regional MENA Director',
                          style: context.headlineSmall,
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
                          'Muhib Marghilani',
                          style: context.headlineMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Technology Wall General Manager',
                          style: context.headlineSmall,
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
