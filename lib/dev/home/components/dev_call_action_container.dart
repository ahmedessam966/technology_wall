import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
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
  final TextEditingController _layoutController = TextEditingController();
  final TextEditingController _servicesController = TextEditingController();
  List<String> selectedServices = [];

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
                    height: 2.h,
                  ),
                  DropdownButtonFormField(
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
                    height: 2.h,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) {
                      if (value != null) {
                        _layoutController.text = value;
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                          value: 'Professional and Concise', child: Text('Professional and Concise')),
                      DropdownMenuItem(value: 'Stylish and Trendy', child: Text('Stylish and Trendy')),
                      DropdownMenuItem(
                          value: 'Informative and Colorful', child: Text('Informative and Colorful')),
                    ],
                    validator: (value) => InputValidationServices.validateName(name: value),
                    decoration: InputDecoration(
                      hintText: 'Choose how would you like your platform to look like...',
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
                        'Layout and Style',
                        style: context.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) {
                      if (value != null) {
                        _layoutController.text = value;
                      }
                    },
                    items: const [
                      DropdownMenuItem(value: 'Mobile Application', child: Text('Mobile Application')),
                      DropdownMenuItem(value: 'Website', child: Text('Website')),
                      DropdownMenuItem(value: 'Hosting Service', child: Text('Hosting Service')),
                      DropdownMenuItem(value: 'Domain Service', child: Text('Domain Service')),
                      DropdownMenuItem(value: 'Hosting Service', child: Text('Hosting Service')),
                      DropdownMenuItem(value: 'Mail Servers', child: Text('Mail Servers')),
                      DropdownMenuItem(
                          value: 'Integrated Solution (All Above Services)',
                          child: Text('Integrated Solution (All Above Services)')),
                    ],
                    validator: (value) => InputValidationServices.validateName(name: value),
                    decoration: InputDecoration(
                      hintText: 'Select the type of service you us to build...',
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
                        'Your Platform Services',
                        style: context.bodyLarge,
                      ),
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
