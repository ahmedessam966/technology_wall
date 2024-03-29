import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/hardware/notebooks/controllers/notebooks_controllers.dart';
import 'web/web_notebooks_body.dart';
import '../../shared/web/direct_dependencies_index.dart';

class NotebooksPage extends StatefulWidget {
  const NotebooksPage({super.key});

  @override
  State<NotebooksPage> createState() => _NotebooksPageState();
}

class _NotebooksPageState extends State<NotebooksPage> {
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateHElement(
        'Technology Wall Notebooks Page',
        'Home to renowned, best-performing, and cost-effective laptops, notebooks, and portable computers.',
        null);
    metadataFunctions.updateMetaData('Technology Wall | Notebooks - Laptops',
        'Whether its for graphic design, architecture and AutoCAD utility, or even gaming purposes, you will always find your desired portable computer here, offered with best prices.');
    metadataFunctions.updateHeaderMetaData();
    metadataFunctions.injectPageSpecificContent(
        'Find and explore our unqiue collection of dependable and versatile portable computers, suitable for every use and every individual',
        'en');
  }

  @override
  void dispose() {
    Provider.of<NotebooksControllers>(context, listen: false).notebooksList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final scroller = ScrollController();
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        if (value) {
          return;
        } else {
          Navigator.of(context).pop();
        }
      },
      child: ImprovedScrolling(
        scrollController: scroller,
        enableMMBScrolling: true,
        enableKeyboardScrolling: true,
        keyboardScrollConfig: const KeyboardScrollConfig(spaceScrollAmount: 0),
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme.darkest,
              onPressed: () {},
              child: const Icon(
                Icons.chat_rounded,
                color: Colors.white70,
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: SvgPicture.asset(
                    'assets/icons/ttten.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                ListView(
                  controller: scroller,
                  physics: const RangeMaintainingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw <= 568 ? 3.w : 6.w, vertical: 2.h),
                      child: sw >= 1080
                          ? const WebHeader()
                          : sw < 1080 && sw >= 568
                              ? const TabletHeader()
                              : const MobileHeader(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                      child: sw >= 1080
                          ? const WebNotebooksBody()
                          : sw < 1080 && sw >= 568
                              ? const SizedBox()
                              : const SizedBox(),
                    ),
                    sw >= 1080
                        ? const WebFooter()
                        : sw < 1080 && sw >= 568
                            ? const TabletFooter()
                            : const MobileFooter(),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
