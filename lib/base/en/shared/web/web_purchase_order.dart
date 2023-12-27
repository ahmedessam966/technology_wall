import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';
import '../../../../core/controllers/email_controller.dart';
import '../../../en/home/controllers/home_page_controllers.dart';

import '../../../../config/input_validation_services.dart';
import '../../../../config/themes/app_theme.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
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
                        'Requisition Order Form',
                        style: context.headlineSmall,
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
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Theme(
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
                                        shape:
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                    onPressed: () async {
                                      // ignore: prefer_is_empty
                                      if (items.length >= 1 && items[0][0] != '') {
                                        provider.changeFormStep(provider.orderFormStep + 1);
                                      } else {}
                                    },
                                    child: Text('Continue',
                                        style: context.bodyLarge?.copyWith(color: Colors.white70)),
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
                                              borderRadius: BorderRadius.circular(2.px))),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          provider.changeFormStep(provider.orderFormStep + 1);
                                        }
                                      },
                                      child: Text('Continue',
                                          style: context.bodyLarge?.copyWith(color: Colors.white70)),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2.px)))),
                                      onPressed: () {
                                        provider.changeFormStep(provider.orderFormStep - 1);
                                      },
                                      child: Text(
                                        'Go Back',
                                        style: context.bodyLarge,
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
                                              borderRadius: BorderRadius.circular(2.px))),
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
                                          ? SpinKitThreeBounce(
                                              size: 15.px,
                                              color: Colors.white,
                                            )
                                          : Text('Submit Purchase Order',
                                              style: context.bodyLarge?.copyWith(color: Colors.white70)),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2.px)))),
                                      onPressed: () {
                                        provider.changeFormStep(provider.orderFormStep - 1);
                                      },
                                      child: Text(
                                        'Go Back',
                                        style: context.bodyLarge,
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
                                'Select Products',
                                style: context.headlineMedium,
                              ),
                              subtitle: Text(
                                  'You can also search for specific products by visiting the sections of the website that corresponds to your desired product type.',
                                  style: context.bodyMedium?.copyWith(fontStyle: FontStyle.italic)),
                              content: SizedBox(
                                height: 40.h,
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
                                                      labelText: 'Product | Description',
                                                      hintStyle: context.bodySmall,
                                                      hintText:
                                                          'This can be a product name or your custom product requirement'),
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
                                                  decoration: const InputDecoration(labelText: 'Quantity'),
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
                                        'Add Item',
                                        style: context.bodyLarge,
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
                                'Request Details',
                                style: context.headlineMedium,
                              ),
                              subtitle: provider.orderFormStep == 1
                                  ? Row(
                                      children: [
                                        Text(
                                            'Your business / personal information. Learn how we process your information by visiting ',
                                            style: context.bodyMedium?.copyWith(fontStyle: FontStyle.italic)),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text('Privacy Center',
                                              style:
                                                  context.bodyMedium?.copyWith(color: Colors.blue.shade700)),
                                        ),
                                      ],
                                    )
                                  : null,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextFormField(
                                    controller: _nameController,
                                    validator: (value) => InputValidationServices.validateName(name: value),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      label: Text(
                                        'Company/Client Name',
                                        style: context.bodyLarge,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextFormField(
                                    controller: _emailController,
                                    validator: (value) => InputValidationServices.validateEmail(email: value),
                                    decoration: InputDecoration(
                                      hintText: 'email@example.com',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      label: Text(
                                        'Company/Client Contact Email',
                                        style: context.bodyLarge,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
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
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                        borderSide: const BorderSide(color: AppTheme.prohibit),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      label: Text(
                                        'Company/Client Contact Phone',
                                        style: context.bodyLarge,
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
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2.px),
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      label: Text(
                                        'Additional Notes (Optional)',
                                        style: context.bodyLarge,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
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
                                'Request Summary',
                                style: context.headlineMedium,
                              ),
                              content: SizedBox(
                                height: 40.h,
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
                                              'Selected Products',
                                              style: context.bodyLarge,
                                            )),
                                        const Spacer(),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Quantity',
                                            style: context.bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    const Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Expanded(flex: 5, child: Divider()),
                                        Spacer(),
                                        Expanded(flex: 1, child: Divider()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder: (context, index) {
                                          return Flex(
                                            direction: Axis.horizontal,
                                            children: [
                                              Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    items[index][0],
                                                    style: context.bodyLarge,
                                                  )),
                                              const Spacer(),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(items[index][1], style: context.bodyLarge)),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Text('Company/Client Name:   ${_nameController.text}',
                                        style: context.bodyLarge),
                                    Text('Company/Client Contact Email:   ${_emailController.text}',
                                        style: context.bodyLarge),
                                    Text('Company/Client Contact Phone:   ${_phoneController.text}',
                                        style: context.bodyLarge),
                                    Text('Additional Notes (Optional):   ${_notesController.text}',
                                        style: context.bodyLarge),
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
