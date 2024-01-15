import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/account/controllers/account_controllers.dart';
import 'package:technology_wall/en/shared/web/direct_dependencies_index.dart';
import 'package:technology_wall/global/controllers/auth_controllers.dart';

class WebAccountPageBody extends StatelessWidget {
  const WebAccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthControllers, AccountControllers>(builder: (context, auth, contact, _) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'My Account - ',
              style: context.headlineLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.white70),
            ),
            SizedBox(height: 5.h),
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.all(30.px),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Contact Information',
                              style: context.headlineSmall,
                            ),
                            TextButton(
                              onPressed: () {
                                contact.enableContactEdit();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    contact.isContactReadOnly
                                        ? CupertinoIcons.pencil_ellipsis_rectangle
                                        : CupertinoIcons.pencil_outline,
                                    color: AppTheme.second,
                                  ),
                                  SizedBox(width: 0.5.w),
                                  Text(
                                    contact.isContactReadOnly ? 'Edit' : 'Editing',
                                    style: context.bodyMedium?.copyWith(color: AppTheme.second),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        TextFormField(
                          readOnly: contact.isContactReadOnly,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: context.bodyMedium,
                            hintText: auth.userModel?.name,
                            hintStyle: context.bodyLarge,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        TextFormField(
                          readOnly: contact.isContactReadOnly,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: context.bodyMedium,
                            hintText: auth.userModel?.email,
                            hintStyle: context.bodyLarge,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        TextFormField(
                          readOnly: contact.isContactReadOnly,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: context.bodyMedium,
                            hintText: auth.userModel?.phone,
                            hintStyle: context.bodyLarge,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.all(30.px),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.zero),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'My Orders',
                          style: context.headlineSmall,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
