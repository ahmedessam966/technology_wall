import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/input_validation_services.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/email_controller.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/core/models/product_model.dart';

class WebPrinterOrderForm extends StatefulWidget {
  final ProductModel printer;
  const WebPrinterOrderForm({super.key, required this.printer});

  @override
  State<WebPrinterOrderForm> createState() => _WebPrinterOrderFormState();
}

late ProductModel printer;
bool _isLoading = false;

class _WebPrinterOrderFormState extends State<WebPrinterOrderForm> {
  @override
  void initState() {
    super.initState();
    printer = widget.printer;
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
      return Dialog(
        backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
        surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px)),
        child: SingleChildScrollView(
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
                      'Order Requisition For ${printer.title}',
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
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px))),
                                onPressed: () {
                                  provider.changeFormStep(provider.orderFormStep + 1);
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
                                      shape:
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px))),
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
                                SizedBox(
                                  width: 1.w,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px)))),
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
                                      shape:
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px))),
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
                                        showAdaptiveDialog(
                                            context: ctx,
                                            builder: (ctx) {
                                              return const AlertDialog.adaptive(
                                                icon: Icon(Icons.done_outline_rounded),
                                                iconColor: Colors.green,
                                                title: Text('Purchase Order Submitted'),
                                                content: Text(
                                                    'Purchase order sent successfully. Expect a confirmation email from Technology Wall soon.'),
                                              );
                                            });
                                        Future.delayed(const Duration(seconds: 5), () {
                                          Navigator.pop(ctx);
                                          Navigator.pop(context);
                                        });
                                        setState(() {
                                          _isLoading = !_isLoading;
                                        });
                                      }
                                    });
                                  },
                                  child: _isLoading
                                      ? SpinKitThreeBounce(
                                          size: 14.px,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'Submit Purchase Order',
                                          style: context.bodyMedium?.copyWith(color: Colors.white70),
                                        ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.px)))),
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
                          title: const Text('Product Requested'),
                          subtitle: const Text('Please confirm the following details.'),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product Details',
                                    style: context.headlineSmall,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SelectableText(
                                    '  - Printer Brand: ${printer.brand}',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Printer Model: ${printer.model}',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Printer Type: ${printer.type}',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Printer Family: ${printer.family}',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Printing Capacity: Up to ${printer.ppm} Papers/Minute',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Recommended Toners: ${printer.toner}',
                                    style: context.bodyLarge,
                                  ),
                                  SelectableText(
                                    '  - Recommended Utility: ${printer.utility}',
                                    style: context.bodyLarge,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.network(
                                printer.snapshot,
                                height: 35.h,
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
                          title: const Text('Request Details'),
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
                              SizedBox(
                                height: 2.h,
                              ),
                              TextFormField(
                                controller: _quantityController,
                                validator: (value) => InputValidationServices.validateNum(Number: value),
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                    'Requested Quantity of ${printer.title}',
                                    style: context.bodyLarge,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
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
                          title: const Text('Request Summary'),
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
                                        'Product Details',
                                        style: context.headlineSmall,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SelectableText(
                                        '  - Printer Brand: ${printer.brand}',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Printer Model: ${printer.model}',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Printer Type: ${printer.type}',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Printer Family: ${printer.family}',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Printing Capacity: Up to ${printer.ppm} Papers/Minute',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Recommended Toners: ${printer.toner}',
                                        style: context.bodyLarge,
                                      ),
                                      SelectableText(
                                        '  - Recommended Utility: ${printer.utility}',
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    printer.snapshot,
                                    height: 35.h,
                                  ),
                                ],
                              ),
                              SelectableText('Company/Client Name:   ${_nameController.text}'),
                              SelectableText('Company/Client Contact Email:   ${_emailController.text}'),
                              SelectableText('Company/Client Contact Phone:   ${_phoneController.text}'),
                              SelectableText('Company/Client Req. Quantity:   ${_quantityController.text}'),
                              SelectableText('Company/Client Additional Notes:   ${_notesController.text}'),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
