import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../../../core/controllers/email_controller.dart';
import '../../../en/home/controllers/home_page_controllers.dart';

import '../../../config/input_validation_services.dart';
import '../../../config/themes/app_theme.dart';

class WebPurchaseOrder extends StatefulWidget {
  const WebPurchaseOrder({super.key});

  @override
  State<WebPurchaseOrder> createState() => _WebPurchaseOrderState();
}

bool _isLoading = false;

class _WebPurchaseOrderState extends State<WebPurchaseOrder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  List<List<String>> items = [
    ['', '']
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomePageControllers, AppControllers>(builder: (context, provider, locale, _) {
      return Semantics(
        label: 'General Purchase Order Form',
        value: 'Request any of our services and we\'ll contact you with a personalized quotation.',
        child: Dialog(
          backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
          surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'requisition_order_form',
                        style: locale.isEnglish ? context.headlineSmall : context.titleSmall,
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
                  const SizedBox(
                    height: 50,
                  ),
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
                              alignment: locale.isEnglish ? Alignment.bottomLeft : Alignment.bottomRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    enableFeedback: true,
                                    backgroundColor: AppTheme.darkest,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                onPressed: () async {
                                  // ignore: prefer_is_empty
                                  if (items.length >= 1 && items[0][0] != '') {
                                    provider.changeFormStep(provider.orderFormStep + 1);
                                  } else {}
                                },
                                child: Text(
                                  'continue_button',
                                  style: locale.isEnglish
                                      ? context.bodyMedium?.copyWith(color: Colors.white70)
                                      : context.displayMedium?.copyWith(color: Colors.white70),
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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      provider.changeFormStep(provider.orderFormStep + 1);
                                    }
                                  },
                                  child: Text(
                                    'continue_button',
                                    style: locale.isEnglish
                                        ? context.bodyMedium?.copyWith(color: Colors.white70)
                                        : context.displayMedium?.copyWith(color: Colors.white70),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                                  onPressed: () {
                                    provider.changeFormStep(provider.orderFormStep - 1);
                                  },
                                  child: Text(
                                    'go_back_button',
                                    style: locale.isEnglish ? context.bodyMedium : context.displayMedium,
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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = !_isLoading;
                                    });
                                    await EmailController.sendGeneralPO(
                                            _nameController.text,
                                            'General Purchase Order',
                                            _notesController.text,
                                            _emailController.text,
                                            _phoneController.text,
                                            items)
                                        .then((value) {
                                      if (value == 200) {
                                        setState(() {
                                          _isLoading = !_isLoading;
                                        });
                                      }
                                    });
                                  },
                                  child: _isLoading
                                      ? const SpinKitThreeBounce(
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'submit_po_button',
                                          style: locale.isEnglish
                                              ? context.bodyMedium?.copyWith(color: Colors.white70)
                                              : context.displayMedium?.copyWith(color: Colors.white70),
                                        ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                                  onPressed: () {
                                    provider.changeFormStep(provider.orderFormStep - 1);
                                  },
                                  child: Text(
                                    'go_back_button',
                                    style: locale.isEnglish ? context.bodyMedium : context.displayMedium,
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
                            'select_products',
                            style: locale.isEnglish ? context.headlineMedium : context.titleMedium,
                          ),
                          subtitle: Text(
                            'select_products_sub',
                            style: locale.isEnglish
                                ? context.bodyMedium?.copyWith(fontStyle: FontStyle.italic)
                                : context.displayMedium?.copyWith(fontStyle: FontStyle.italic),
                          ),
                          content: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: 'product_field_label',
                                                  hintStyle: locale.isEnglish
                                                      ? context.bodySmall
                                                      : context.displaySmall?.copyWith(fontSize: 8),
                                                  hintText: 'product_field_hint'),
                                              onChanged: (value) {
                                                setState(() {
                                                  items[index][0] = value;
                                                });
                                              },
                                            ),
                                          ),
                                          const Spacer(),
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              decoration:
                                                  const InputDecoration(labelText: 'qunatity_field_label'),
                                              onChanged: (value) {
                                                setState(() {
                                                  items[index][1] = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      items.add(['', '']);
                                    });
                                  },
                                  child: Text(
                                    'add_item_button',
                                    style: locale.isEnglish ? context.bodyMedium : context.displayMedium,
                                  ),
                                ),
                              ],
                            ),
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
                            'request_details',
                            style: locale.isEnglish ? context.headlineMedium : context.titleMedium,
                          ),
                          subtitle: provider.orderFormStep == 1
                              ? Row(
                                  children: [
                                    Text(
                                      'personal_info',
                                      style: locale.isEnglish
                                          ? context.bodyMedium?.copyWith(fontStyle: FontStyle.italic)
                                          : context.displayMedium?.copyWith(fontStyle: FontStyle.italic),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'privacy_center_button',
                                        style: locale.isEnglish
                                            ? context.bodySmall?.copyWith(color: Colors.blue.shade700)
                                            : context.displaySmall?.copyWith(color: Colors.blue.shade700),
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _nameController,
                                validator: (value) => InputValidationServices.validateName(name: value),
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
                                    'client_field_label',
                                    style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (value) => InputValidationServices.validateEmail(email: value),
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
                                    'email_field_label',
                                    style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
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
                                      return 'Invalid Phone Number';
                                    }
                                  }
                                  return null;
                                },
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                  hintText: '00966XXXXXXXXX or 05XXXXXXXX',
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
                                    'phone_field_label',
                                    style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: _notesController,
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
                                    'notes_field_label',
                                    style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
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
                            'request_summary',
                            style: locale.isEnglish ? context.headlineMedium : context.titleMedium,
                          ),
                          content: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: Text(
                                          locale.isEnglish ? 'Selected Products' : 'العناصر المُختارة',
                                          style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
                                        )),
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        locale.isEnglish ? 'Quantity' : 'الكمية',
                                        style: locale.isEnglish ? context.bodyLarge : context.displayLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(flex: 5, child: Divider()),
                                    Spacer(),
                                    Expanded(flex: 2, child: Divider()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Expanded(flex: 5, child: Text(items[index][0])),
                                          const Spacer(),
                                          Expanded(flex: 2, child: Text(items[index][1])),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Text('${'client_field_label'}:   ${_nameController.text}'),
                                Text('${'email_field_label'}:   ${_emailController.text}'),
                                Text('${'phone_field_label'}:   ${_phoneController.text}'),
                                Text('${'notes_field_label'}:   ${_notesController.text}'),
                                const SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
