import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import '../../../config/input_validation_services.dart';
import '../../../config/themes/app_theme.dart';

class DevCallToActionContainer extends StatefulWidget {
  const DevCallToActionContainer({super.key});

  @override
  State<DevCallToActionContainer> createState() => _DevCallToActionContainerState();
}

bool _isLoading = false;

class _DevCallToActionContainerState extends State<DevCallToActionContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final List<String> _selectedServices = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.px),
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        gradient: LinearGradient(colors: [
          const Color(0xaa26344b).withOpacity(1),
          const Color(0xaa246af3).withOpacity(1),
        ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0), blurRadius: 3, color: Colors.black38),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            'Ready to get started?',
            style: context.labelLarge?.copyWith(color: Colors.white, fontSize: 18.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Join the elite enterprise leaders with a masterclass integrated solution',
            style: context.labelLarge?.copyWith(color: Colors.white70),
          ),
          Text(
            'Let us know a little about your business and we\'ll get you started',
            style: context.labelLarge?.copyWith(color: Colors.white70),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: EdgeInsets.all(50.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: const Color(0xaaf3f3f3).withOpacity(1),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) => InputValidationServices.validateName(name: value),
                    decoration: InputDecoration(
                      hintText: 'Typically, the name of your enterprise or business...',
                      hintStyle: context.bodyMedium,
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
                        'Company / Business Name',
                        style: context.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DropdownButtonFormField(
                    style: context.labelLarge,
                    onChanged: (value) {
                      if (value != null) {
                        _activityController.text = value;
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                          value: 'Corporate Communications', child: Text('Corporate Communications')),
                      DropdownMenuItem(
                          value: 'Corporate Social Responsibility (CSR)',
                          child: Text('Corporate Social Responsibility (CSR)')),
                      DropdownMenuItem(value: 'Customer Service', child: Text('Customer Service')),
                      DropdownMenuItem(
                          value: 'Finance and Accounting', child: Text('Finance and Accounting')),
                      DropdownMenuItem(value: 'Human Resources', child: Text('Human Resources')),
                      DropdownMenuItem(value: 'Legal and Compliance', child: Text('Legal and Compliance')),
                      DropdownMenuItem(
                          value: 'Networking and Relationship Building',
                          child: Text('Networking and Relationship Building')),
                      DropdownMenuItem(
                          value: 'Product or Service Development',
                          child: Text('Product or Service Development')),
                      DropdownMenuItem(
                          value: 'Production or Service Delivery',
                          child: Text('Production or Service Delivery')),
                      DropdownMenuItem(value: 'Risk Management', child: Text('Risk Management')),
                      DropdownMenuItem(value: 'Sales and Marketing', child: Text('Sales and Marketing')),
                      DropdownMenuItem(value: 'Strategic Planning', child: Text('Strategic Planning')),
                      DropdownMenuItem(
                          value: 'Supply Chain Management', child: Text('Supply Chain Management')),
                      DropdownMenuItem(
                          value: 'Technology and Information Systems',
                          child: Text('Technology and Information Systems')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    validator: (value) => InputValidationServices.validateName(name: value),
                    decoration: InputDecoration(
                      hintText: 'Major activity your business performs...',
                      hintStyle: context.bodyMedium,
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
                        'Business Field',
                        style: context.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Select the services you would like to build...',
                    style: context.labelLarge,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered) ? 2 : 0),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    onPressed: () {
                      if (_selectedServices.contains('Mobile Application')) {
                        setState(() {
                          _selectedServices.remove('Mobile Application');
                        });
                      } else {
                        setState(() {
                          _selectedServices.add('Mobile Application');
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mobile Application',
                          style: context.labelLarge,
                        ),
                        Checkbox.adaptive(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(MaterialState.selected) ? Colors.green : null),
                            value: _selectedServices.contains('Mobile Application'),
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered) ? 2 : 0),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    onPressed: () {
                      if (_selectedServices.contains('Website')) {
                        setState(() {
                          _selectedServices.remove('Website');
                        });
                      } else {
                        setState(() {
                          _selectedServices.add('Website');
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Website',
                          style: context.labelLarge,
                        ),
                        Checkbox.adaptive(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(MaterialState.selected) ? Colors.green : null),
                            value: _selectedServices.contains('Website'),
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered) ? 2 : 0),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    onPressed: () {
                      if (_selectedServices.contains('Hosting Services')) {
                        setState(() {
                          _selectedServices.remove('Hosting Services');
                        });
                      } else {
                        setState(() {
                          _selectedServices.add('Hosting Services');
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hosting Services',
                          style: context.labelLarge,
                        ),
                        Checkbox.adaptive(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(MaterialState.selected) ? Colors.green : null),
                            value: _selectedServices.contains('Hosting Services'),
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered) ? 2 : 0),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    onPressed: () {
                      if (_selectedServices.contains('Mail Server Services')) {
                        setState(() {
                          _selectedServices.remove('Mail Server Services');
                        });
                      } else {
                        setState(() {
                          _selectedServices.add('Mail Server Services');
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mail Server Services',
                          style: context.labelLarge,
                        ),
                        Checkbox.adaptive(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(MaterialState.selected) ? Colors.green : null),
                            value: _selectedServices.contains('Mail Server Services'),
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered) ? 2 : 0),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    onPressed: () {
                      if (_selectedServices.contains('Integrated Solution')) {
                        setState(() {
                          _selectedServices.remove('Integrated Solution');
                        });
                      } else {
                        setState(() {
                          _selectedServices.removeWhere((element) => element != 'Integrated Solution');
                          _selectedServices.add('Integrated Solution');
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Integrated Solution (All Inclusive)',
                          style: context.labelLarge,
                        ),
                        Checkbox.adaptive(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(MaterialState.selected) ? Colors.green : null),
                            value: _selectedServices.contains('Integrated Solution'),
                            onChanged: (newValue) {}),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) => InputValidationServices.validateEmail(email: value),
                    decoration: InputDecoration(
                      hintText: 'We\'ll use this email to follow up with you...',
                      hintStyle: context.bodyMedium,
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
                        'Contact Email Address',
                        style: context.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xaa246af3)),
                      shape: const MaterialStatePropertyAll(LinearBorder()),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(1.w)),
                      overlayColor: const MaterialStatePropertyAll(Colors.white38),
                    ),
                    child: _isLoading
                        ? const SpinKitThreeBounce(
                            color: Colors.white,
                          )
                        : Text(
                            'Submit',
                            style: context.labelLarge?.copyWith(color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
