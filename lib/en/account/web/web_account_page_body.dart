import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/shared/web/direct_dependencies_index.dart';
import 'package:technology_wall/global/controllers/app_controllers.dart';
import 'package:technology_wall/global/controllers/auth_controllers.dart';

class WebAccountPageBody extends StatelessWidget {
  const WebAccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthControllers, AppControllers>(builder: (context, auth, app, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SlideInUp(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              height: 45.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Account Details',
                      style:
                          context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.px,
                        // foregroundImage: NetworkImage(auth.userModel!.profileImage!),
                        backgroundImage: const AssetImage('assets/images/avatar.png'),
                        backgroundColor: Colors.white.withOpacity(1),
                      ),
                      SizedBox(width: 2.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            auth.userModel!.name,
                            style: context.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70),
                          ),
                          Text(
                            auth.userModel!.email,
                            style: context.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70),
                          ),
                          Text(
                            'User ID: ${auth.userModel!.id}',
                            style: context.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xaaf1f1f1).withOpacity(1),
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppTheme.second.withOpacity(1),
                      AppTheme.third.withOpacity(1),
                    ]),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const SizedBox(),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
