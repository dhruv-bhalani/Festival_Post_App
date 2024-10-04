import 'package:festival_post_maker/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Routes.homePage);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('lib/assets/gif/splash.gif'),
      ),
    );
  }
}
