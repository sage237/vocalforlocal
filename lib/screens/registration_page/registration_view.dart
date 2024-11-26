import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core_theme/colors.dart';
import '../../core_theme/text_theme.dart';
import '../../routes/routes.dart';
import '../../utils/screen_util.dart';
import 'registration_controller.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController registrationController = Get.find();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Registration'),
      // ),
      backgroundColor: Colors.black,

      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.safeBlockHorizontal * 3),
        child: Form(
          key: registrationController.form1,
          child: PageView(
            controller: registrationController.pageController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 15,
                  ),
                  Text(
                    'Welcome to vocal for local',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineMedium!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 5,
                  ),
                  Text(
                    'Enter Contact Details',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineSmall!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB,
                  ),
                  Text(
                    'We will send you a 4 digit verification code',
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                  TextFormField(
                    controller: registrationController.mobileController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required";
                      }
                      if (val.length != 10) {
                        return "Invalid mobile number";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefix: const Text('+91  '),
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "Mobile number",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                  TextFormField(
                    controller: registrationController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      // if (val == null || val.isEmpty) {
                      //   return "Required";
                      // }
                      if (val != null && val.isNotEmpty) {
                        if (!(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val))) {
                          return 'Invalid email ';
                        }
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "email address",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  const Spacer(),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => registrationController.sendOTP(),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text('Get OTP'),
                      ),
                    ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.sellerRegistrationPage);
                          },
                          child: const Text(
                            'Register as seller',
                            style: TextStyle(color: AppColor.midpurple),
                          )),
                    ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 20,
                  ),
                  Text(
                    'Membership Details',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineSmall!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 1.5,
                  ),
                  Text(
                    'Tell us your name',
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                  TextFormField(
                    controller: registrationController.firstNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required";
                      }
                      // if (val.length != 10) {
                      //   return "Invalid mobile number";
                      // }
                      return null;
                    },
                    decoration: InputDecoration(
                      // prefix: const Text('+91  '),
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "First Name",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                  TextFormField(
                    controller: registrationController.lastNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "Last Name",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  const Spacer(),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: registrationController.sendName,
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text('NEXT'),
                      ),
                    ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('SKIP'),
                    ),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 15,
                  ),
                  Text(
                    'Hi ${registrationController.firstNameController.text}',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineSmall!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 1.5,
                  ),
                  Text(
                    'Tell us your important dates',
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                        color: Colors.grey),
                  ),
                  // SizedBox(
                  //   height: Responsive.safeBlockVerticalWAB * 1.0,
                  // ),
                  Text(
                    "You'll get special offers!!!",
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodySmall!.fontSize,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: registrationController.birthdayController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      registrationController
                          .pickDate(registrationController.birthdayController);
                    },
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required";
                      }
                      // if (val.length != 10) {
                      //   return "Invalid mobile number";
                      // }
                      return null;
                    },
                    decoration: InputDecoration(
                      // prefix: const Text('+91  '),
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "Birthday",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: registrationController.anniversaryController,
                    keyboardType: TextInputType.datetime,
                    onTap: () {
                      registrationController.pickDate(
                          registrationController.anniversaryController);
                    },
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      // if (val == null || val.isEmpty) {
                      //   return "Required";
                      // }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "Anniversary",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  const Spacer(),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: registrationController.sendDates,
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text('NEXT'),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
