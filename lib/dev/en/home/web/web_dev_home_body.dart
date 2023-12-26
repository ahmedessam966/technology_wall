import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/dev/en/home/components/dev_coustomer_carousel.dart';

class WebDevHomeBody extends StatelessWidget {
  const WebDevHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 650,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                const Color(0xaa26344b).withOpacity(1),
                const Color(0xaa246af3),
              ], begin: AlignmentDirectional.topCenter, end: AlignmentDirectional.bottomCenter),
              boxShadow: const [BoxShadow(color: Colors.black87, offset: Offset(5, 5), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/dev_images/code.png',
                      height: 150,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome to Development Center',
                      style: context.labelLarge
                          ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Boost digital business presence.',
                    style: context.labelLarge
                        ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Design, pace, implement, and affirm your digital print.',
                    style: context.labelLarge
                        ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: Text(
                    'All the tools and technologies needed to create your degital entity. Reach out to your clients through our comprehensive web development kit plans.',
                    textAlign: TextAlign.center,
                    style:
                        context.headlineSmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xaaf5f5f5).withOpacity(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Request Now',
                        style: context.labelLarge?.copyWith(
                          color: const Color(0xaa246af3).withOpacity(1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white24;
                          } else {
                            return null;
                          }
                        }),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Showcases',
                            style: context.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  height: 150,
                  child: DevCustomersCarousel(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
