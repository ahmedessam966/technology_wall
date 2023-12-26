import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/input_validation_services.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/core/controllers/email_controller.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/core/models/notebook_model.dart';
import 'package:another_flushbar/flushbar.dart';

class WebNotebookOrderForm extends StatefulWidget {
  final dynamic item;
  const WebNotebookOrderForm({super.key, required this.item});

  @override
  State<WebNotebookOrderForm> createState() => _WebNotebookOrderFormState();
}

late NotebookModel notebook;
bool _isLoading = false;

class _WebNotebookOrderFormState extends State<WebNotebookOrderForm> {
  @override
  void initState() {
    super.initState();
    notebook = widget.item;
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
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
                      'Order Requisition For ${notebook.brand} ${notebook.series} ${notebook.model}',
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
                                    await EmailController.sendEmail(
                                      _nameController.text,
                                      'Printer Purchase Order',
                                      _notesController.text,
                                      _emailController.text,
                                      _phoneController.text,
                                      notebook.title,
                                      int.parse(_quantityController.text),
                                    ).then((value) {
                                      setState(() {
                                        _isLoading = !_isLoading;
                                      });
                                      if (value == 200) {
                                        Flushbar(
                                          title: 'Purchase Order Received',
                                          leftBarIndicatorColor: Colors.green.shade600,
                                          borderRadius: BorderRadius.circular(10),
                                          titleColor: Colors.green,
                                          flushbarPosition: FlushbarPosition.BOTTOM,
                                          duration: const Duration(seconds: 5),
                                          message:
                                              'Your purchase order for ${notebook.title} has been sent successfully. You will receive email confirmation shortly.',
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '  - Notebook Brand: ${notebook.brand[0].toUpperCase() + notebook.brand.substring(1)}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Notebook Model: ${notebook.model[0].toUpperCase() + notebook.model.substring(1)}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Notebook Series: ${notebook.series[0].toUpperCase() + notebook.series.substring(1)}',
                                    style: context.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Product Specs',
                                    style: context.headlineSmall,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '  - Processor: ${notebook.processor}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Operating System: ${notebook.os}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Graphics: ${notebook.graphics}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Memory: ${notebook.memory}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Storage: ${notebook.storage}',
                                    style: context.bodyLarge,
                                  ),
                                  Text(
                                    '  - Display: ${notebook.display}',
                                    style: context.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.network(
                                notebook.snapshot,
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
                          title: const Text('Request Details'),
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
                              TextFormField(
                                controller: _quantityController,
                                validator: (value) => InputValidationServices.validateNum(Number: value),
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
                                    'Requested Quantity of ${notebook.title}',
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
                          state: provider.orderFormStep == 1
                              ? StepState.indexed
                              : provider.orderFormStep > 1
                                  ? StepState.complete
                                  : StepState.indexed,
                          isActive: provider.orderFormStep == 1,
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
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '  - Notebook Brand: ${notebook.brand[0].toUpperCase() + notebook.brand.substring(1)}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Notebook Model: ${notebook.model[0].toUpperCase() + notebook.model.substring(1)}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Notebook Series: ${notebook.series[0].toUpperCase() + notebook.series.substring(1)}',
                                        style: context.bodyLarge,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Product Specs',
                                        style: context.headlineSmall,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '  - Processor: ${notebook.processor}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Operating System: ${notebook.os}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Graphics: ${notebook.graphics}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Memory: ${notebook.memory}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Storage: ${notebook.storage}',
                                        style: context.bodyLarge,
                                      ),
                                      Text(
                                        '  - Display: ${notebook.display}',
                                        style: context.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    notebook.snapshot,
                                    height: 300,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text('Company/Client Name:   ${_nameController.text}'),
                              Text('Company/Client Contact Email:   ${_emailController.text}'),
                              Text('Company/Client Contact Phone:   ${_phoneController.text}'),
                              Text('Company/Client Req. Quantity:   ${_quantityController.text}'),
                              Text('Company/Client Additional Notes:   ${_notesController.text}'),
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
      );
    });
  }
}
