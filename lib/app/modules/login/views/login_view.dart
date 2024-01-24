import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:square_health_task/app/data/constants/app_text_style.dart';
import 'package:square_health_task/app/data/constants/image_path.dart';
import 'package:square_health_task/app/utilities/extensions/widget.extensions.dart';
import 'package:square_health_task/app/utilities/widgets/common_widgets/custom_text_form_field.dart';
import 'package:square_health_task/app/utilities/widgets/common_widgets/primary_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Image.asset(
                    ImagePath.authCard,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 150,
                  child: Image.asset(
                    ImagePath.appLogo,
                    height: 100,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.verticalSpacing,
                  const Text(
                    'Sign in',
                    style: AppTextStyle.styleFont32BlueW600,
                  ),
                  42.verticalSpacing,

                  /// Email Field
                  const Text(
                    'Email',
                    style: AppTextStyle.primaryTextStyle,
                  ),
                  14.verticalSpacing,
                  CustomTextFormField(
                    controller: controller.emailTextController,
                    fillColor: Colors.white,
                    focusBorderActive: true,
                    enableBorderActive: true,
                    hintText: "Type email here...",
                    textInputType: TextInputType.text,
                  ),
                  28.verticalSpacing,

                  /// Password Field
                  const Text(
                    'Password',
                    style: AppTextStyle.primaryTextStyle,
                  ),
                  14.verticalSpacing,
                  CustomTextFormField(
                    controller: controller.passwordTextController,
                    fillColor: Colors.white,
                    focusBorderActive: true,
                    enableBorderActive: true,
                    obsCureText: true,
                    hintText: "Type password here...",
                    textInputType: TextInputType.text,
                  ),

                  /// Sign in Button
                  28.verticalSpacing,
                  PrimaryButton(
                    height: 54,
                    onTap: () {},
                    text: 'Sign in',
                  ),

                  28.verticalSpacing,
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.SIGN_UP);
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Don\'t have an account? ',
                                style: AppTextStyle.secondaryTextStyle),
                            TextSpan(
                                text: 'Sign up',
                                style: AppTextStyle.secondaryAuthTextStyle)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
