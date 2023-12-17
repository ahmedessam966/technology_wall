import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/home/controllers/home_page_controllers.dart';

import '../../../config/input_validation_services.dart';
import '../../../config/themes/app_theme.dart';
import '../../controllers/email_controller.dart';

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
    return Consumer<HomePageControllers>(builder: (context, provider, _) {
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
                        'Order Requisition Form',
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
                              alignment: Alignment.bottomLeft,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    enableFeedback: true,
                                    backgroundColor: AppTheme.darkest,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                onPressed: () {
                                  // ignore: prefer_is_empty
                                  if (items.length >= 1 && items[0][0] != '') {
                                    provider.changeFormStep(provider.orderFormStep + 1);
                                  } else {
                                    Flushbar(
                                      title: 'Missing Items',
                                      message: 'At least one item is required before proceeding',
                                      duration: const Duration(seconds: 5),
                                      mainButton: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Dismiss',
                                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                                          )),
                                    ).show(context);
                                  }
                                },
                                child: Text(
                                  'Continue',
                                  style: context.bodyMedium?.copyWith(color: Colors.white70),
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
                                    'Continue',
                                    style: context.bodyMedium?.copyWith(color: Colors.white70),
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
                                  child: const Text('Go Back'),
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
                                        Flushbar(
                                          onStatusChanged: (status) {
                                            if (status == FlushbarStatus.DISMISSED) {
                                              Navigator.pushNamed(context, '/');
                                            }
                                          },
                                          title: 'Purchase Order Received',
                                          leftBarIndicatorColor: Colors.green.shade600,
                                          borderRadius: BorderRadius.circular(10),
                                          titleColor: Colors.green,
                                          flushbarPosition: FlushbarPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          message:
                                              'Your purchase order has been sent successfully. You will receive email confirmation shortly.',
                                        ).show(context);
                                      }
                                    });
                                  },
                                  child: _isLoading
                                      ? const SpinKitThreeBounce(
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'Submit Purchase Order',
                                          style: context.bodyMedium?.copyWith(color: Colors.white70),
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
                                  child: const Text('Go Back'),
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
                          title: const Text('Select Products'),
                          subtitle: Text(
                            'You can also search for specific products by visiting the sections of the website that corresponds to your desired product type.',
                            style: context.bodySmall?.copyWith(fontStyle: FontStyle.italic),
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
                                  child: const Text('Add Item'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Step(
                          state: provider.orderFormStep == 1
                              ? StepState.indexed
                              : provider.orderFormStep > 1
                                  ? StepState.complete
                                  : StepState.indexed,
                          isActive: provider.orderFormStep == 1,
                          title: const Text('Request Details'),
                          subtitle: provider.orderFormStep == 1
                              ? Row(
                                  children: [
                                    Text(
                                      'Your business / personal information. Learn how we process your information by visiting ',
                                      style: context.bodySmall,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Privacy Center',
                                        style: context.bodySmall?.copyWith(color: Colors.blue.shade700),
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
                                    'Company/Client Name',
                                    style: context.bodyLarge,
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
                                    'Company/Client Contact Email',
                                    style: context.bodyLarge,
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
                                    'Additional Notes (Optional)',
                                    style: context.bodyLarge,
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
                          title: const Text('Request Summary'),
                          content: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(flex: 5, child: Text('Selected Products')),
                                    Spacer(),
                                    Expanded(flex: 2, child: Text('Quantity')),
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
                                Text('Company/Client Name:   ${_nameController.text}'),
                                Text('Company/Client Contact Email:   ${_emailController.text}'),
                                Text('Company/Client Contact Phone:   ${_phoneController.text}'),
                                Text('Company/Client Additional Notes:   ${_notesController.text}'),
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
