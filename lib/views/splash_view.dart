import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      authController.listenForLoginStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          textColor: Colors.black54,
          style: FlutterLogoStyle.markOnly,
          size: 250,
        ),
      ),
    );
  }
}
