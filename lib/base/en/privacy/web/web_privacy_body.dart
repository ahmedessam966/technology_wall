import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';

import '../../../../core/controllers/metadata_controllers.dart';

class WebPrivacyBody extends StatelessWidget {
  const WebPrivacyBody({super.key});

  @override
  Widget build(BuildContext context) {
    MetadataControllers metadataControllers = MetadataControllers();
    metadataControllers.injectPageSpecificContent(
        'We respect your privacy and take the safety of your online shopping seriously. However, in order to be able to provide you with better products, more effective customer service, and personalized updates, we may record a set of information from your visit to the our website. For disclosure and transparency, the following statemnts describe policies and procedures, and how and why your information is collected and used.',
        'en');
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
                    'assets/icons/qqquad.svg',
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
                          'Privacy Center',
                          style: context.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70, fontSize: 80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: Text(
                          'Privacy Policy & Terms of Service',
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
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Acknowledgement',
                  overflow: TextOverflow.clip,
                  style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Technology Wall is a provider for renowned branded products - software, hardware, or otherwise indicated in the displayed products - and as such is displaying trademarks and logos for the respective brands, trademarks, and companies. Consequently, Technology Wall is using the trademark names and logos for promoting sales and business needs of the respctive entities and does not own or promote any brand as its own. All brands, trademarks, logos, and names of the promoted products and services are property of their respective entities and are used in this website for describing and annotating the product\'s or service\'s manufacturer. Technology Wall does not authorize or allow the use of the displayed brands, trademarks, logos, and names of the trademark owners without prior consent, written or otherwise indicated, by the owner of said trademark.',
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  'Privacy Policy',
                  overflow: TextOverflow.clip,
                  style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'We respect your privacy and take the safety of your online shopping seriously. However, in order to be able to provide you with better products, more effective customer service, and personalized updates, we may record a set of information from your visit to the our website. For disclosure and transparency, the following statemnts describe policies and procedures, and how and why your information is collected and used.',
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Why we may need your personal information:',
                style: context.headlineSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• Facilitating utility of the site for you so you won\'t be required to repetitively insert your information for each and  every transaction.',
                style: context.bodyLarge,
              ),
              Text(
                '• Help you find information, products and services quickly.',
                style: context.bodyLarge,
              ),
              Text(
                '• Send you occassional alerts and advertisements about any new information, products or services we offer.',
                style: context.bodyLarge,
              ),
              Text(
                '• To provide you with information, products or services that you requested on our site, or any other applicable means of communication, or products and services that we may implicitly understand might be of any interest to you through your overall site interactions, and where you have consented to be contacted for such purposes.',
                style: context.bodyLarge,
              ),
              Text(
                '• To provide you with services based on where you are located, such as geo-located advertising, search results, and other content tailored for you.',
                style: context.bodyLarge,
              ),
              Text(
                '• To implement the obligations resulting from any contracts concluded between you and any other party using our site, or between you and our entity.',
                style: context.bodyLarge,
              ),
              Text(
                '• To improve our services and to provide better and more personalized services.',
                style: context.bodyLarge,
              ),
              Text(
                '• To ensure that the content of our site is presented in the most effective way for you as well as ensure its compatibility with the device you are using to access our site.',
                style: context.bodyLarge,
              ),
              Text(
                '• To notify you of changes to our site.',
                style: context.bodyLarge,
              ),
              Text(
                '• For any other reason we may deem necessary to enhance your browsing experience on the website.',
                style: context.bodyLarge,
              ),
              Text(
                '• To administer incentive programs and fulfill your requests for these incentives, to allow you to participate in competitions and to notify you with that event\'s status updates.',
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Registration and orders:',
                style: context.headlineSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• Before you use certain parts of the site or use it to place your order, you must complete the registration process on our site, where you will be requested for some personal of your information including, but not limited to: email address, physical address, phone number, full name, payment card details, and work organization credentials.',
                style: context.bodyLarge,
              ),
              Text(
                '• This type of personal information is used for billing purposes, completing your order, communicating with you on matters related to your order and our site, and for internal marketing purposes.',
                style: context.bodyLarge,
              ),
              Text(
                '• If we encounter any problem in completing your request, we may use the personal information you provided to us to contact you.',
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Email address:',
                style: context.headlineSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• Some sections of this website require you to enter your email address for purposes of free promotional campaigns and, in case you have requested, respond to your requests of notifying you about new brands, products, or latest models, or to participate in our newsletter.',
                style: context.bodyLarge,
              ),
              Text(
                '• Your participation in any of our competitions is voluntary and you may choose to participate and disclose to us certain information that may later be used to verify and notify competition winners and award them prizes.',
                style: context.bodyLarge,
              ),
              Text(
                '• We may list the names, account names, or aliases of the participants in any, or all competitions organized by our entity on our website, or any of our entity\'s subsidiary websites.',
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Cookies and other online trackers:',
                style: context.headlineSmall,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '• We employ cookies and web beacons, also known as clear GIF technology or action tags, to speed up the navigation process on the site, recognize you and your access privileges, and track your use of the site.',
                style: context.bodyLarge,
              ),
              Text(
                '• Cookies are small pieces of information that are stored in the form of text files by your internet browser on the internal storage of the device you are using and thus are not accessible to our website without your prior consent.',
                style: context.bodyLarge,
              ),
              Text(
                '• You can set your browser to reject these files from websites or to remove them from your hard drive. However, this action may affect your experience on our website and may even make some sections or services on our website inaccessible.',
                style: context.bodyLarge,
              ),
              Text(
                '• We use cookies to enable you to select products, place them in your cart, and complete the purchase process without losing track of your progress.',
                style: context.bodyLarge,
              ),
              Text(
                '• If you choose to accept these cookies we will be able to obtain a history of your browsing and purchases.',
                style: context.bodyLarge,
              ),
              Text(
                '• Website cookies are not “spyware” as they do not and cannot infiltrate the user’s hard drive to collect confidential personal information.',
                style: context.bodyLarge,
              ),
              Text(
                '• Web beacons help deliver cookies and help us determine whether a particular page on the site has been viewed and how many times it has been viewed. For example, any, or all, images on this site, such as advertising banners, may be considered web beacons.',
                style: context.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
