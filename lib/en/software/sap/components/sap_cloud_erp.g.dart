part of '../web/web_sap_body.dart';

class SAPCloudERP extends StatelessWidget {
  const SAPCloudERP({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xaaf7f7f7).withOpacity(1),
      surfaceTintColor: const Color(0xaaf7f7f7).withOpacity(1),
      shape: const LinearBorder(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Exploring Cloud ERP Solution',
                  style: context.headlineSmall,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Divider(
            indent: 3.w,
            endIndent: 3.w,
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            'What is cloud ERP',
                            style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 2.h),
                          SelectableText(
                            'Cloud ERP is enterprise resource planning software that is delivered over the Internet. It gives growing companies access to their mission-critical applications at any time, from any location – and offers a near infinite ability to scale and innovate',
                            style: context.bodyLarge,
                          ),
                          SizedBox(height: 4.h),
                          SelectableText(
                            'Hosted on a provider’s cloud computing platform, cloud ERP is typically delivered “as a service” (software-as-a-service or SaaS ERP). Customers don’t own the software, but instead lease it on an annual or monthly subscription basis. There are no upfront hardware costs – and the vendor takes care of application maintenance, upgrades and innovations, data storage, and security.',
                            style: context.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Fsap-cloud-erp.png?alt=media&token=bf63e25d-952f-48ca-95cf-b19d8ce1f1a5'),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Cloud ERP product screenshot showing a dashboard of available resources on a project. Resource at sap.com',
                            style: context.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.second.withOpacity(1),
                        AppTheme.darkest.withOpacity(1),
                      ],
                    ),
                  ),
                  child: Center(
                    child: SelectableText(
                      'The importance of of cloud ERP for midmarket companies',
                      style: context.bodyLarge?.copyWith(color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: SelectableText(
                      'Cloud ERPs offer a scalable platform with scads of features and integrations, improve financial efficiency and visibility, strengthen data security for financial information, and decrease Information Technology (IT) costs.',
                      textAlign: TextAlign.center,
                      style: context.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    color: const Color(0XAAF7F7F7).withOpacity(1),
                    boxShadow: const [
                      BoxShadow(color: Colors.black54, offset: Offset(0, 0), blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        'Improved Agility',
                        style: context.headlineMedium,
                      ),
                      SizedBox(height: 2.h),
                      SelectableText(
                        'Agility is particularly important to midsize companies with growth potential. These companies are often specialists in their industries, working in verticals such as professional services. They have deep customer relationships. To grow rapidly, they need to seize opportunities – adding new locations, introducing new products and services, making acquisitions, or responding to competitor failures.',
                        style: context.bodyLarge,
                      ),
                      SizedBox(height: 2.h),
                      SelectableText(
                        'An old system that is not flexible and easily expandable will constrain growth because it can’t provide information needed for decisions quickly enough. If a company relies on independent reporting systems – many of which use workarounds and Excel spreadsheets to overcome lack of integration – it’s difficult for departments to share information and work together to meet common, time-sensitive goals.',
                        style: context.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    color: const Color(0XAAF7F7F7).withOpacity(1),
                    boxShadow: const [
                      BoxShadow(color: Colors.black54, offset: Offset(0, 0), blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        'Financial visibilty and effeciency',
                        style: context.headlineMedium,
                      ),
                      SizedBox(height: 2.h),
                      SelectableText(
                        'In midsize companies, top management tends to be very cost conscious. The lifeblood of medium businesses is cash flow – and improving profit margin is often a top priority. Building balance sheet reserves – and fueling growth – requires a careful eye on working capital, operating expenses, and investments. And none of this can be done in a silo. Cloud ERP integrates accounting processes with business operations, both internal and external – so absolutely everything can be accounted for with accuracy. ',
                        style: context.bodyLarge,
                      ),
                      SizedBox(height: 2.h),
                      SelectableText(
                        'While all midsize companies have some type of accounting system, many of these systems fail to deliver immediate cash flow and vital profitability information. They often don’t meet the current needs of the business or integrate with other systems. ',
                        style: context.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    color: const Color(0XAAF7F7F7).withOpacity(1),
                    boxShadow: const [
                      BoxShadow(color: Colors.black54, offset: Offset(0, 0), blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        'Ease of application integration',
                        style: context.headlineMedium,
                      ),
                      SizedBox(height: 2.h),
                      SelectableText(
                        'Midsize businesses have typically been quick to adopt point solutions for specific operational needs – such as call center software or field service systems – but slow to change their backbone ERP. However, adding these “bolt -on” solutions has added great expense and complexity because these tools don’t easily connect to the ERP system. Now, modern cloud ERP is changing all of that – causing more and more growing companies to reevaluate their ERP choice. Increasingly, companies are opting for the easy integration, scalability, and agility that comes with cloud ERP.',
                        style: context.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
