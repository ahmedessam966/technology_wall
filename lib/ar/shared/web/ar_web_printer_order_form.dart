import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/input_validation_services.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/email_controller.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/core/models/printer_model.dart';
import 'package:another_flushbar/flushbar.dart';

class ARWebOrderForm extends StatefulWidget {
  final dynamic item;
  const ARWebOrderForm({super.key, required this.item});

  @override
  State<ARWebOrderForm> createState() => _ARWebOrderFormState();
}

late PrinterModel printer;
bool _isLoading = false;

class _ARWebOrderFormState extends State<ARWebOrderForm> {
  @override
  void initState() {
    super.initState();
    printer = widget.item;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryControllers>(builder: (context, provider, _) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
          surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'طلب لـ ${printer.title}',
                      style: context.titleMedium,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        provider.changeFormStep(0);
                        _formKey.currentState!.reset();
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Theme(
                          data: ThemeData(
                            colorScheme: const ColorScheme.light(primary: AppTheme.darkest),
                          ),
                          child: Stepper(
                              currentStep: provider.orderFormStep,
                              controlsBuilder: (ctx, details) {
                                switch (details.currentStep) {
                                  case 0:
                                    return Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            enableFeedback: true,
                                            backgroundColor: AppTheme.darkest,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5))),
                                        onPressed: () {
                                          provider.changeFormStep(provider.orderFormStep + 1);
                                        },
                                        child: Text(
                                          'متابعة',
                                          style: context.displayMedium?.copyWith(color: Colors.white70),
                                        ),
                                      ),
                                    );
                                  case 1:
                                    return Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              enableFeedback: true,
                                              backgroundColor: AppTheme.darkest,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5))),
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              provider.changeFormStep(provider.orderFormStep + 1);
                                            }
                                          },
                                          child: Text(
                                            'متابعة',
                                            style: context.displayMedium?.copyWith(color: Colors.white70),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5)))),
                                          onPressed: () {
                                            provider.changeFormStep(provider.orderFormStep - 1);
                                          },
                                          child: Text(
                                            'عودة للسابق',
                                            style: context.displayMedium,
                                          ),
                                        ),
                                      ],
                                    );
                                  case 2:
                                    return Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              enableFeedback: true,
                                              backgroundColor: AppTheme.darkest,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5))),
                                          onPressed: () async {
                                            setState(() {
                                              _isLoading = !_isLoading;
                                            });
                                            await EmailController.sendEmail(
                                                    _nameController.text,
                                                    'Printer Purchase Order',
                                                    _notesController.text,
                                                    _emailController.text,
                                                    _phoneController.text,
                                                    printer.title,
                                                    int.parse(_quantityController.text))
                                                .then((value) {
                                              if (value == 200) {
                                                setState(() {
                                                  _isLoading = !_isLoading;
                                                });
                                                Flushbar(
                                                  title: 'Purchase Order Received',
                                                  leftBarIndicatorColor: Colors.green.shade600,
                                                  borderRadius: BorderRadius.circular(10),
                                                  titleColor: Colors.green,
                                                  flushbarPosition: FlushbarPosition.BOTTOM,
                                                  duration: const Duration(seconds: 5),
                                                  message:
                                                      'Your purchase order for ${printer.title} has been sent successfully. You will receive email confirmation shortly.',
                                                ).show(context).whenComplete(() => Navigator.pop(context));
                                              }
                                            });
                                          },
                                          child: _isLoading
                                              ? const SpinKitThreeBounce(
                                                  size: 14,
                                                  color: Colors.white,
                                                )
                                              : Text(
                                                  'إرسال طلب الشراء',
                                                  style:
                                                      context.displayMedium?.copyWith(color: Colors.white70),
                                                ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5)))),
                                          onPressed: () {
                                            provider.changeFormStep(provider.orderFormStep - 1);
                                          },
                                          child: Text(
                                            'عودة للسابق',
                                            style: context.displayMedium,
                                          ),
                                        ),
                                      ],
                                    );
                                  default:
                                    return const SizedBox.shrink();
                                }
                              },
                              steps: [
                                Step(
                                  state: provider.orderFormStep == 0
                                      ? StepState.indexed
                                      : provider.orderFormStep > 0
                                          ? StepState.complete
                                          : StepState.indexed,
                                  isActive: provider.orderFormStep == 0,
                                  title: Text(
                                    'المنتج المطلوب',
                                    style: context.titleSmall,
                                  ),
                                  subtitle: Text(
                                    'يرجى تأكيد التفاصيل التالية.',
                                    style: context.displayLarge,
                                  ),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'تفاصيل المنتج',
                                            style: context.titleSmall,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SelectableText(
                                            '• العلامة التجارية للطابعة: ${printer.brand[0].toUpperCase() + printer.brand.substring(1)}',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• موديل الطابعة: ${printer.model.toUpperCase()}',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• نوع الطابعة: ${printer.type}',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• عائلة الطابعة: ${printer.family}',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• القدرة على الطباعة: ${printer.ppm} ورقة/دقيقة',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• الأحبار الموصى بها: ${printer.toner}',
                                            style: context.displayLarge,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SelectableText(
                                            '• الأستخدام الموصى به: ${printer.utility == 'Home' ? 'منزلي' : printer.utility == 'Small Business/Home' ? 'أعمال صغيرة / منزلي' : 'مكتبي'}',
                                            style: context.displayLarge,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Image.network(
                                        printer.snapshot,
                                        height: 300,
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                //
                                //
                                Step(
                                  state: provider.orderFormStep == 1
                                      ? StepState.indexed
                                      : provider.orderFormStep > 1
                                          ? StepState.complete
                                          : StepState.indexed,
                                  isActive: provider.orderFormStep == 1,
                                  title: Text(
                                    'تفاصيل الطلب',
                                    style: context.titleSmall,
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _nameController,
                                        style: context.displayMedium,
                                        validator: (value) {
                                          if (value == null) {
                                            return null;
                                          }
                                          if (value.isEmpty) {
                                            return 'اسم الشركة/العميل مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          label: Text(
                                            'اسم الشركة/العميل',
                                            style: context.displayLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        validator: (value) {
                                          if (value == null) {
                                            return null;
                                          }
                                          if (value.isEmpty) {
                                            return 'البريد الإلكتروني مطلوب';
                                          }
                                          InputValidationServices.validateEmail(email: value);
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'email@example.com',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          label: Text(
                                            'البريد الإلكتروني لجهة الاتصال بالشركة/العميل',
                                            style: context.displayLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _phoneController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value != null) {
                                            if (value.length < 10) {
                                              return 'رقم الهاتف غير صحيح';
                                            }
                                          }
                                          return null;
                                        },
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          hintText: '00966XXXXXXXXX أو 05XXXXXXXX',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          label: Text(
                                            'هاتف الاتصال بالشركة/العميل',
                                            style: context.displayLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _quantityController,
                                        validator: (value) {
                                          if (value == null) {
                                            return null;
                                          }
                                          if (value.isEmpty) {
                                            return 'الكمية مطلوبة';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            borderSide: const BorderSide(color: AppTheme.prohibit),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          label: Text(
                                            'الكمية المطلوبة ${printer.title}',
                                            style: context.displayLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: _notesController,
                                        style: context.displayMedium,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          label: Text(
                                            'ملاحظات إضافية (اختياري)',
                                            style: context.displayLarge,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                //
                                //
                                //
                                Step(
                                  state: provider.orderFormStep == 2
                                      ? StepState.indexed
                                      : provider.orderFormStep > 2
                                          ? StepState.complete
                                          : StepState.indexed,
                                  isActive: provider.orderFormStep == 2,
                                  title: Text(
                                    'ملخص الطلب',
                                    style: context.titleSmall,
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'تفاصيل المنتج',
                                                style: context.titleSmall,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SelectableText(
                                                '• العلامة التجارية للطابعة: ${printer.brand[0].toUpperCase() + printer.brand.substring(1)}',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• موديل الطابعة: ${printer.model.toUpperCase()}',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• نوع الطابعة: ${printer.type}',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• عائلة الطابعة: ${printer.family}',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• القدرة على الطباعة: ${printer.ppm} ورقة/دقيقة',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• الأحبار الموصى بها: ${printer.toner}',
                                                style: context.displayLarge,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SelectableText(
                                                '• الأستخدام الموصى به: ${printer.utility}',
                                                style: context.displayLarge,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.network(
                                            printer.snapshot,
                                            height: 300,
                                          ),
                                        ],
                                      ),
                                      SelectableText(
                                        'اسم الشركة/العميل: ${_nameController.text}',
                                        style: context.displayLarge,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SelectableText(
                                        'البريد الإلكتروني لجهة اتصال الشركة/العميل: ${_emailController.text}',
                                        style: context.displayLarge,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SelectableText(
                                        'هاتف الاتصال بالشركة/العميل: ${_phoneController.text}',
                                        style: context.displayLarge,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SelectableText(
                                        'ملاحظات إضافية للشركة/العميل: ${_notesController.text}',
                                        style: context.displayLarge,
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
