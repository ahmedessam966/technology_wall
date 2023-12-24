import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

class WebContactBody extends StatelessWidget {
  const WebContactBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'assets/icons/ttten.svg',
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
                          'Technology Wall',
                          style: context.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'Contact Us',
                          style: context.headlineLarge
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppTheme.darkest.withOpacity(1),
                    const Color(0xaa4d3589).withOpacity(1),
                  ]),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: context.headlineSmall?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'We\'d love to hear from you',
                            style: context.headlineMedium
                                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'We always value your feedback and opinions. You can contact us via the contact information listed here, or by filling the contact form and we\'ll reach out to you! You can also check the frequently asked questions section of this page to get assistance faster.',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Fill in the form and we\'ll make sure to contact you regarding your questions, messages, or concerns as soon as possible.',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 5,
                          shape: const LinearBorder(),
                          margin: EdgeInsets.zero,
                          color: const Color(0xaaf7f7f7).withOpacity(1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                            child: Form(
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      floatingLabelStyle: context.bodyLarge,
                                      label: const Text('Full Name'),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      floatingLabelStyle: context.bodyLarge,
                                      label: const Text('Email Address'),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      floatingLabelStyle: context.bodyLarge,
                                      label: const Text('Phone Number'),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  DropdownButtonFormField(
                                      style: context.bodyLarge,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        floatingLabelStyle: context.bodyLarge,
                                        label: const Text('Subject'),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(1),
                                          borderSide: const BorderSide(color: Colors.black54),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(1),
                                          borderSide: const BorderSide(color: Colors.black54),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(1),
                                          borderSide: const BorderSide(color: Colors.black54),
                                        ),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'General Query',
                                          child: Text('General Query'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Purchases',
                                          child: Text('Purchases'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Refunds',
                                          child: Text('Refunds'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Warranty',
                                          child: Text('Warranty'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Post-Sales',
                                          child: Text('Post-Sales'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Pre-Sales',
                                          child: Text('Purchases'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Feedback',
                                          child: Text('Feedback'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Complaint',
                                          child: Text('Complaint'),
                                        ),
                                      ],
                                      onChanged: (newValue) {}),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      floatingLabelStyle: context.bodyLarge,
                                      label: const Text('Your Message'),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const LinearBorder(), foregroundColor: Colors.black),
                                      onPressed: () {},
                                      child: const Text('Send'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
