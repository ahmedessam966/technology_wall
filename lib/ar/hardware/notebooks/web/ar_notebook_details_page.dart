// import 'package:flutter/material.dart';
// import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
// import 'package:provider/provider.dart';
// import 'package:technology_wall/core/models/notebook_model.dart';

// import 'package:technology_wall/hardware/printers/mobile/mobile_details_body.dart';
// import 'package:technology_wall/hardware/printers/tablet/tablet_details_body.dart';
// import 'package:technology_wall/hardware/printers/web/web_prrinter_details_body.dart';

// import '../../../core/controllers/app_controllers.dart';
// import '../../../core/widgets/mobile/mobile_footer.dart';
// import '../../../core/widgets/mobile/non_web_drawer.dart';
// import '../../../core/widgets/tablet/tablet_footer.dart';
// import '../../../core/widgets/web/web_footer.dart';

// class NotebookDetailsPage extends StatefulWidget {
//   final NotebookModel? notebook;
//   const NotebookDetailsPage({super.key, required this.notebook});

//   @override
//   State<NotebookDetailsPage> createState() => _NotebookDetailsPageState();
// }

// late NotebookModel? notebook;

// class _NotebookDetailsPageState extends State<NotebookDetailsPage> {
//   @override
//   void initState() {
//     notebook = widget.notebook;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double sw = MediaQuery.of(context).size.width;
//     final double sh = MediaQuery.of(context).size.height;
//     final double ar = MediaQuery.of(context).size.aspectRatio;
//     final provider = Provider.of<AppControllers>(context, listen: true);
//     final scroller = ScrollController();
//     return Semantics(
//       label: '${notebook?.brand} ${notebook?.model}',
//       value: '${notebook?.brand}, ${notebook?.model}, ${notebook?.title}, laptop, notebook',
//       child: PopScope(
//         canPop: true,
//         onPopInvoked: (value) {
//           if (value) {
//             return;
//           } else {
//             Navigator.of(context).pop();
//           }
//         },
//         child: ImprovedScrolling(
//           scrollController: scroller,
//           enableMMBScrolling: true,
//           enableKeyboardScrolling: true,
//           child: Scaffold(
//             key: sw < 1280 ? provider.nonWebScaffoldKey : null,
//             drawer: sw < 1280
//                 ? NonWebDrawer(
//                     sw: sw,
//                     sh: sh,
//                     ar: ar,
//                   )
//                 : null,
//             body: ListView(
//               controller: scroller,
//               physics: const RangeMaintainingScrollPhysics(),
//               children: [
//                 sw >= 1280
//                     ? WebPrinterDetailsBody(printer: printer)
//                     : sw < 1280 && sw >= 768
//                         ? TabletPrinterDetailsBody(
//                             sw: sw,
//                             sh: sh,
//                             ar: ar,
//                             printer: printer,
//                           )
//                         : MobilePrinterDetailsBody(
//                             sw: sw,
//                             sh: sh,
//                             ar: ar,
//                             printer: printer,
//                           ),
//                 sw >= 1280
//                     ? const WebFooter()
//                     : sw < 1280 && sw >= 768
//                         ? TabletFooter(
//                             sw: sw,
//                             sh: sh,
//                             ar: ar,
//                           )
//                         : MobileFooter(
//                             sw: sw,
//                             sh: sh,
//                             ar: ar,
//                           ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
