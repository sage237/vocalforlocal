import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/screen_util.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Second init ${Responsive.screenWidth},${Responsive.screenHeight},');
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/logo.png'),
        ));
  }
}
