import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/input_validation_services.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:technology_wall/en/shared/web/direct_dependencies_index.dart';
import 'package:technology_wall/global/controllers/auth_controllers.dart';

class WebLoginTypeSelector extends StatefulWidget {
  const WebLoginTypeSelector({super.key});

  @override
  State<WebLoginTypeSelector> createState() => _WebLoginTypeSelectorState();
}

class _WebLoginTypeSelectorState extends State<WebLoginTypeSelector> {
  bool _isMain = true;
  bool _isObscure = true;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AnimatedContainer(
        duration: const Duration(seconds: 20),
        curve: Curves.easeInCubic,
        child: _isMain
            ? AlertDialog.adaptive(
                icon: const Icon(Icons.account_tree_rounded),
                shape: const LinearBorder(),
                title: Text(
                  'Select Login Type',
                  style: context.headlineMedium,
                ),
                actions: [
                  ListTile(
                    enableFeedback: true,
                    enabled: true,
                    onTap: () {
                      setState(() {
                        _isMain = false;
                      });
                    },
                    title: const Text(
                      'Website User',
                    ),
                    subtitle: const Text('Select this if you are accessing your account on Technology Wall'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    enableFeedback: true,
                    enabled: true,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/en/portal');
                    },
                    title: const Text(
                      'Zoho Customer Portal',
                    ),
                    subtitle:
                        const Text('Select this if you are accessing your Zoho-Technology Wall account'),
                    trailing: const Icon(Icons.chevron_right_outlined),
                  ),
                ],
              )
            : Dialog(
                shape: const LinearBorder(),
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logo1.webp',
                          height: 15.h,
                        ),
                        SizedBox(height: 1.h),
                        const Divider(),
                        SizedBox(height: 1.h),
                        Text(
                          'Sign in',
                          style: context.headlineMedium,
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'Sign in to your account to access your cart, tailored promotions, and purchase history',
                          style: context.bodyLarge,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) => InputValidationServices.validateEmail(email: value),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail_sharp,
                              color: AppTheme.second.withOpacity(1),
                            ),
                            hintText: 'email@example.com',
                            hintStyle: context.bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                              borderSide: const BorderSide(color: AppTheme.prohibit),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                              borderSide: const BorderSide(color: AppTheme.prohibit),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text(
                              'Email Address',
                              style: context.bodyLarge,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextFormField(
                          controller: _passController,
                          obscureText: _isObscure,
                          validator: (value) => InputValidationServices.validatePassword(password: value),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.key_sharp,
                              color: AppTheme.second.withOpacity(1),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off,
                                color: AppTheme.second.withOpacity(1),
                              ),
                            ),
                            hintText: 'Your password',
                            hintStyle: context.bodyMedium,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                              borderSide: const BorderSide(color: AppTheme.prohibit),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.px),
                              borderSide: const BorderSide(color: AppTheme.prohibit),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text(
                              'Password',
                              style: context.bodyLarge,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            child: Text(
                              'Forgot Password?',
                              style: context.bodyMedium,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: BaseRectButton(
                            child: _isLoading
                                ? SpinKitCircle(
                                    color: Colors.white70,
                                    size: 20.px,
                                  )
                                : Text(
                                    'Sign in',
                                    style: context.bodyMedium?.copyWith(color: Colors.white70),
                                  ),
                            action: () async {
                              if (_loginFormKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                final auth = Provider.of<AuthControllers>(context, listen: false);
                                final res = await auth.userLogin(_emailController.text, _passController.text);
                                // ignore: use_build_context_synchronously
                                res == 200 ? Navigator.pop(context) : print(res);
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
