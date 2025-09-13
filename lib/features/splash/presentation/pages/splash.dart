import 'package:flutter/material.dart';

import '../../../../core/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/to-do.png',
          color: Theme.of(context).colorScheme.primary,
          width: width * 0.75,
        ),
      ),
    );
  }
}
