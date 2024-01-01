import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../global/controllers/metadata_controllers.dart';

class ARWebPrivacyBody extends StatelessWidget {
  const ARWebPrivacyBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'تحتوي هذه الصفحة على إقرارات وشروط الخدمة وسياسة الخصوصية الخاصة بسور التكنولوجيا.', 'ar');
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
                          'مركز الخصوصية',
                          style: context.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'سياسة الخصوصية وشروط الخدمة',
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
              Center(
                child: Text(
                  'إقرار',
                  overflow: TextOverflow.clip,
                  style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'تعد سور التكنولوجيا مزودًا للمنتجات ذات العلامات التجارية الشهيرة - البرامج أو الأجهزة أو ما هو موضح بطريقة أخرى في المنتجات المعروضة - وعلى هذا النحو تعرض العلامات التجارية والشعارات الخاصة بالعلامات التجارية والشركات المعنية. وبالتالي، يستخدم سور التكنولوجيا أسماء العلامات التجارية والشعارات لتعزيز المبيعات واحتياجات الأعمال الخاصة بالكيانات المعنية، ولا تمتلك أو تروج أو تنسب اليها أي علامة تجارية خاصة بالمنتجات او الخدمات المعروضة بخلاف ما يذكر عليه أنه ضمن العلامة التجارية أو اسم سور التكنولوجيا. جميع العلامات التجارية والأسماء والشعارات وأسماء المنتجات والخدمات التي يتم الترويج لها هي ملك للكيانات المعنية وتستخدم في هذا الموقع لوصف الشركة المصنعة للمنتج أو الخدمة والتعليق عليها. لا يسمح سور التكنولوجيا باستخدام العلامات التجارية والأسماء والشعارات وأسماء مالكي العلامات التجارية المعروضة دون موافقة مسبقة، كتابية أو مذكورة بطريقة أخرى، من قبل مالك العلامة التجارية المذكورة أو من قبل الجهات المعنية باختصاصت حقوق العلامات التجارية وحقوق الملكية الفكرية.',
                style: context.displayLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'سياسة الخصوصية',
                  overflow: TextOverflow.clip,
                  style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'نحن نحترم خصوصيتك ونأخذ سلامة تسوقك عبر الإنترنت على محمل الجد. ولكي نتمكن من تزويدك بمنتجات أفضل وخدمة عملاء أكثر فعالية وتحديثات مخصصة، قد نقوم بتسجيل مجموعة من المعلومات من زيارتك لموقعنا الإلكتروني. من أجل الإفصاح والشفافية، تصف العبارات التالية السياسات والإجراءات، وكيف ولماذا يتم جمع معلوماتك واستخدامها.',
                style: context.displayLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'لماذا قد نحتاج إلى معلوماتك الشخصية:',
                style: context.titleSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• تسهيل فائدة الموقع لك حتى لا يُطلب منك إدخال معلوماتك بشكل متكرر لكل معاملة.',
                style: context.displayLarge,
              ),
              Text(
                '• مساعدتك في العثور على المعلومات والمنتجات والخدمات بسرعة.',
                style: context.displayLarge,
              ),
              Text(
                '• نرسل لك بين الحين والآخر تنبيهات وإعلانات حول أي معلومات أو منتجات أو خدمات جديدة نقدمها.',
                style: context.displayLarge,
              ),
              Text(
                '• لتزويدك بالمعلومات أو المنتجات أو الخدمات التي طلبتها على موقعنا، أو أي وسيلة اتصال أخرى قابلة للتطبيق، أو المنتجات والخدمات التي قد نفهم ضمنيًا أنها قد تكون ذات أهمية بالنسبة لك من خلال تفاعلاتك الشاملة على الموقع، وحيثما تكون لقد قد وافقت على أن يتم الاتصال بك لهذه الأغراض.',
                style: context.displayLarge,
              ),
              Text(
                '• لتزويدك بالخدمات بناءً على مكان تواجدك، مثل الإعلانات المتعلقة بالموقع الجغرافي ونتائج البحث والمحتويات الأخرى المصممة خصيصًا لك.',
                style: context.displayLarge,
              ),
              Text(
                '• لتنفيذ الالتزامات الناتجة عن أي عقود يتم إبرامها بينك وبين أي طرف آخر يستخدم موقعنا، أو بينك وبين منشأتنا.',
                style: context.displayLarge,
              ),
              Text(
                '• تحسين خدماتنا وتقديم خدمات أفضل وأكثر تخصيصًا.',
                style: context.displayLarge,
              ),
              Text(
                '• التأكد من تقديم محتوى موقعنا بالطريقة الأكثر فعالية بالنسبة لك وكذلك ضمان توافقه مع الجهاز الذي تستخدمه للوصول إلى موقعنا.',
                style: context.displayLarge,
              ),
              Text(
                '• لإعلامك بالتغييرات التي تطرأ على موقعنا.',
                style: context.displayLarge,
              ),
              Text(
                '• لأي سبب آخر قد نعتبره ضروريًا لتحسين تجربة التصفح الخاصة بك على الموقع.',
                style: context.displayLarge,
              ),
              Text(
                '• لإدارة برامج الحوافز وتلبية طلباتك لهذه الحوافز، للسماح لك بالمشاركة في المسابقات وإعلامك بتحديثات حالة هذا الحدث.',
                style: context.displayLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'التسجيل والطلبات:',
                style: context.titleSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• قبل استخدام أجزاء معينة من الموقع أو استخدامه لتقديم طلبك، يجب عليك إكمال عملية التسجيل على موقعنا، حيث سيُطلب منك بعض المعلومات الشخصية الخاصة بك بما في ذلك، على سبيل المثال لا الحصر: عنوان البريد الإلكتروني، العنوان الفعلي ورقم الهاتف والاسم الكامل وتفاصيل بطاقة الدفع وبيانات اعتماد تنظيم العمل.',
                style: context.displayLarge,
              ),
              Text(
                '• يتم استخدام هذا النوع من المعلومات الشخصية لأغراض إعداد الفواتير، وإكمال طلبك، والتواصل معك بشأن الأمور المتعلقة بطلبك وموقعنا، ولأغراض التسويق الداخلي.',
                style: context.displayLarge,
              ),
              Text(
                '• إذا واجهنا أي مشكلة في إكمال طلبك، فقد نستخدم المعلومات الشخصية التي قدمتها لنا للاتصال بك.',
                style: context.displayLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'البريد الإلكتروني:',
                style: context.titleSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• تتطلب منك بعض أقسام هذا الموقع إدخال عنوان بريدك الإلكتروني لأغراض الحملات الترويجية المجانية، وفي حالة طلبك، الاستجابة لطلباتك لإعلامك بالعلامات التجارية الجديدة أو المنتجات أو أحدث الموديلات، أو المشاركة في نشرتنا الإخبارية .',
                style: context.displayLarge,
              ),
              Text(
                '• إن مشاركتك في أي من مسابقاتنا طوعية، ويمكنك اختيار المشاركة والكشف لنا عن بعض المعلومات التي قد يتم استخدامها لاحقًا للتحقق من الفائزين في المسابقة وإخطارهم ومنحهم الجوائز.',
                style: context.displayLarge,
              ),
              Text(
                '• قد نقوم بإدراج الأسماء أو أسماء الحسابات أو الأسماء المستعارة للمشاركين في أي أو جميع المسابقات التي تنظمها شركتنا على موقعنا الإلكتروني، أو أي من المواقع الإلكترونية الفرعية التابعة لنا.',
                style: context.displayLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'ملفات تعريف الارتباط وأجهزة التتبع الأخرى عبر الإنترنت:',
                style: context.titleSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• نحن نستخدم ملفات تعريف الارتباط وإشارات الويب، والمعروفة أيضًا بتقنية GIF الواضحة أو علامات الإجراءات، لتسريع عملية التنقل على الموقع، والتعرف عليك وعلى امتيازات الوصول الخاصة بك، وتتبع استخدامك للموقع.',
                style: context.displayLarge,
              ),
              Text(
                '• ملفات تعريف الارتباط هي أجزاء صغيرة من المعلومات يتم تخزينها في شكل ملفات نصية بواسطة متصفح الإنترنت الخاص بك على وحدة التخزين الداخلية للجهاز الذي تستخدمه، وبالتالي لا يمكن الوصول إليها على موقعنا دون موافقتك المسبقة.',
                style: context.displayLarge,
              ),
              Text(
                '• يمكنك ضبط متصفحك لرفض هذه الملفات من مواقع الويب أو لإزالتها من محرك الأقراص الثابتة لديك. ومع ذلك، قد يؤثر هذا الإجراء على تجربتك على موقعنا الإلكتروني وقد يؤدي إلى عدم إمكانية الوصول إلى بعض الأقسام أو الخدمات الموجودة على موقعنا.',
                style: context.displayLarge,
              ),
              Text(
                '• نحن نستخدم ملفات تعريف الارتباط لتمكينك من تحديد المنتجات ووضعها في سلة التسوق الخاصة بك وإكمال عملية الشراء دون فقدان مسار التقدم الذي تحرزه.',
                style: context.displayLarge,
              ),
              Text(
                '• إذا اخترت قبول ملفات تعريف الارتباط هذه، فسنكون قادرين على الحصول على سجل التصفح والمشتريات الخاصة بك على موقعنا.',
                style: context.displayLarge,
              ),
              Text(
                '• ملفات تعريف الارتباط الخاصة بموقع الويب ليست "برامج تجسس" لأنها لا تتسلل إلى القرص الصلب الخاص بالمستخدم ولا تستطيع جمع معلومات شخصية سرية.',
                style: context.displayLarge,
              ),
              Text(
                '• تساعد إشارات الويب في توصيل ملفات تعريف الارتباط وتساعدنا في تحديد ما إذا كانت صفحة معينة على الموقع قد تمت مشاهدتها وعدد مرات مشاهدتها. على سبيل المثال، أي أو كل الصور الموجودة على هذا الموقع، مثل اللافتات الإعلانية، يمكن اعتبارها إشارات ويب.',
                style: context.displayLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
