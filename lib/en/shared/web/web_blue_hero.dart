import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'base_rect_button.dart';

class WebBlueHero extends StatelessWidget {
  final String titleBig;
  final String titleSmall;
  final String firstHead;
  final String firstSub;
  final String secondHead;
  final String secondSub;
  final String actionPhrase;
  final bool hasButton;
  final String? buttonTitle;
  final String image;
  final dynamic buttonAction;
  const WebBlueHero({
    super.key,
    required this.titleBig,
    required this.titleSmall,
    required this.firstHead,
    required this.firstSub,
    required this.secondHead,
    required this.secondSub,
    required this.actionPhrase,
    required this.hasButton,
    this.buttonTitle,
    required this.image,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: SlideInLeft(
              duration: const Duration(milliseconds: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SelectableText(titleBig,
                      style: context.headlineMedium?.copyWith(
                          color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 1.h,
                  ),
                  SelectableText(titleSmall,
                      style: context.headlineSmall?.copyWith(
                          color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      SelectableText(firstHead,
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1))),
                      SizedBox(
                        width: 1.h,
                      ),
                      const Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Color(0xaaffffff),
                      ),
                    ],
                  ),
                  SelectableText(firstSub,
                      style: context.headlineSmall?.copyWith(
                          color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      SelectableText(secondHead,
                          style: context.bodyLarge?.copyWith(color: const Color(0xaaffffff).withOpacity(1))),
                      SizedBox(
                        width: 1.h,
                      ),
                      const Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Color(0xaaffffff),
                      ),
                    ],
                  ),
                  SelectableText(secondSub,
                      style: context.headlineSmall?.copyWith(
                          color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 4.h,
                  ),
                  SelectableText(actionPhrase,
                      style: context.headlineSmall?.copyWith(
                          color: const Color(0xaad1d7e0).withOpacity(1), fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 2.h,
                  ),
                  hasButton
                      ? BaseRectButton(title: buttonTitle ?? '', action: buttonAction)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 5,
            child: Image.network(
              image,
              height: 35.h,
            ),
          ),
        ],
      ),
    );
  }
}
