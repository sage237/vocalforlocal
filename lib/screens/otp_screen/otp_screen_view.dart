import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/screen_util.dart';
import 'otp_screen_controller.dart';

class OTPScreenView extends GetView<OTPController> {
  const OTPScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.safeBlockHorizontal * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: Responsive.safeBlockVertical),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: Responsive.safeBlockVertical * 1.5),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        // Center(
                        //   child: Image.asset(
                        //     'assets/logo/mummylogo.png',
                        //     height: Responsive.safeBlockVertical * 5,
                        //     fit: BoxFit.fitHeight,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Responsive.safeBlockVertical * 2,
                ),
                Text(
                  'Enter OTP Received',
                  style: TextStyle(
                    fontSize: Responsive.safeBlockVertical * 1.99,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Responsive.safeBlockVertical * .5,
                ),
                Text(
                  ' on ${controller.mobileno}  ${controller.email.isNotEmpty ? 'and ${controller.email}' : ''}',
                  style: TextStyle(
                      fontSize: Responsive.safeBlockVertical * 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: Responsive.safeBlockVertical * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    otpNumberWidget(0),
                    otpNumberWidget(1),
                    otpNumberWidget(2),
                    otpNumberWidget(3),
                  ],
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: !controller.resendButton.value
                          ? null
                          : () => controller.resendOTP(controller.mobileno),
                      child: Text(!controller.resendButton.value
                          ? 'Resend OTP in ${controller.timeRemaining.value + 1} seconds'
                          : 'Resend OTP'),
                    )),
                const Spacer(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: controller.visible.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: Responsive.safeBlockVertical * 4,
                          child: MaterialButton(
                              onPressed: () {
                                controller.checkOTP();
                              },
                              color: Colors.indigo,
                              child: Text(
                                'CONTINUE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Responsive.safeBlockVertical * 2),
                              )),
                        ),
                ),
                SizedBox(height: Responsive.safeBlockVertical),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otpButtonWidget('1'),
                    otpButtonWidget('2'),
                    otpButtonWidget('3'),
                  ],
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otpButtonWidget('4'),
                    otpButtonWidget('5'),
                    otpButtonWidget('6'),
                  ],
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    otpButtonWidget('7'),
                    otpButtonWidget('8'),
                    otpButtonWidget('9'),
                  ],
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextButton(onPressed: null, child: Text('')),
                    otpButtonWidget('0'),
                    TextButton(
                        onPressed: () {
                          controller.removeCharAtIndex();
                        },
                        child: Icon(Icons.backspace,
                            color: Colors.indigo,
                            size: Responsive.safeBlockVertical * 3.2)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return GestureDetector(
        onTap: () {
          if (position <= controller.text.value.length) {
            controller.index.value = position;
          }
        },
        child: Container(
          height: Responsive.safeBlockHorizontal * 17,
          width: Responsive.safeBlockHorizontal * 17,
          decoration: BoxDecoration(
              border: Border.all(
                  color: controller.index.value == position
                      ? Colors.blue
                      : Colors.white,
                  width: Responsive.safeBlockHorizontal / 3),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Center(
              child: Text(
            controller.text.value.length > position
                ? controller.text.value[position]
                : '',
            style: TextStyle(
                // color: Colors.black,
                fontSize: Responsive.safeBlockVertical * 2.5),
          )),
        ),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  Widget otpButtonWidget(String value) {
    return TextButton(
        onPressed: () {
          controller.onKeyboardTap(
            value,
          );
        },
        child: Text(
          value,
          style: TextStyle(
              color: Colors.indigo,
              fontSize: Responsive.safeBlockVertical * 3.5),
        ));
  }
}
