import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
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
          color: const Color(0xaaf1f1f1).withOpacity(1),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 50),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color(0xaa4d3589).withOpacity(1),
                    AppTheme.darkest.withOpacity(1),
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
                            'Fill in the form and we\'ll make sure to contact you regarding your questions, suggestions, proposals, or concerns as soon as possible.',
                            style: context.bodyLarge?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Divider(
                            indent: 30,
                            endIndent: 30,
                            color: Colors.white60,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'You can also reach out to us via',
                            style: context.headlineSmall?.copyWith(color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(CupertinoIcons.phone_down_fill, color: Colors.white),
                              const SizedBox(width: 15),
                              Text('+966542575808', style: context.bodyLarge?.copyWith(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Icon(CupertinoIcons.mail_solid, color: Colors.white),
                              const SizedBox(width: 15),
                              Text('info@techwall.com.sa',
                                  style: context.bodyLarge?.copyWith(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Card(
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
                                            DropdownMenuItem(
                                              value: 'Other',
                                              child: Text('Other'),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('Learn more about how we process your personal information ',
                                    style: context.bodyMedium?.copyWith(color: Colors.white70)),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/en/privacy');
                                  },
                                  child: Text('Privacy Center',
                                      style: context.bodyMedium?.copyWith(color: Colors.white)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Frequently Asked Questions',
                  style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SelectableText(
                'Q: It has been more than 3 days since I requested to contact and I haven\'t received anything from your side.',
                style: context.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(
                      'A: We apologize for any inconvenience and we always appreciate our clients\' engagements. If it has been 3 BUSINESS DAYS, we advise you to check your spam/junk folder for any emails from Technology Wall. If you still didn\'t recieve an email, please submit another contact request or call us directly at +966542575808.',
                      style: context.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SelectableText(
                'Q: When can I expect a callback or reply regarding my complaint/refund?',
                style: context.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(
                      'A: We strive to offer exceptional services to our valued clients and we appreciate your feedback. However, if you have already submitted a complaint or a request for refund, you should hear back from us within 3-5 BUSINESS DAYS.',
                      style: context.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SelectableText(
                'Q: Does Technology Wall offer maintenance services?',
                style: context.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(
                      'A: Yes we do. Technology Wall employs a large number of experienced and dedicated maintenance technicians and engineers that would be more than happy to assist you with maintenance of desktops, notebooks, printers, servers, and almost every other hardware, whether it was bought through us or any other venue.',
                      style: context.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SelectableText(
                'Q: Do I get to keep the liceneses and license keys of the software products when I make a purchase?',
                style: context.headlineSmall,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  shape: const LinearBorder(),
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  color: Colors.white70.withOpacity(1),
                  surfaceTintColor: Colors.white70.withOpacity(1),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SelectableText(
                      'A: Most certainly yes. Once you\'ve made a purchase, it implies that you have also paid for its license and thus has become at your disposal and preferred discretion. However, Some software, though you are entitled for to maintain their licenses, can only be implemented and installed with certified professionals, as is the case with, for instance, SAP ERP Solutions as these licenses require further verifications from both SAP and the certified SAP distributor/vendor. Feel free to inquire about the terms and conditions that are allocated for software services prior to your purchase.',
                      style: context.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}