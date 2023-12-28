import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/app_theme.dart';
import 'package:technology_wall/core/controllers/app_controllers.dart';

class CustomersCarousel extends StatelessWidget {
  const CustomersCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppControllers>(context, listen: false);
    return Container(
      color: AppTheme.darkest,
      child: FutureBuilder(
          future: provider.getClientThumbs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SpinKitPulse(
                  color: Color(0xaaf7f7f7),
                ),
              );
            } else {
              return SlideInRight(
                animate: false,
                child: FlutterCarousel.builder(
                  itemCount: snapshot.data?.length,
                  options: CarouselOptions(
                    pageSnapping: false,
                    viewportFraction: 0.25,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayInterval: const Duration(milliseconds: 50),
                    autoPlay: true,
                    height: 30.h,
                    showIndicator: false,
                  ),
                  itemBuilder: (context, index, _) {
                    final String path = snapshot.data![index];
                    return Image.network(
                      path,
                      width: 8.w,
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
