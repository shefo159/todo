import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home.dart';
import '../../features/splash/presentation/pages/splash.dart';

class Routes{
  static const String splash = RoutesName.splash;
  static const String home = RoutesName.home;

  static const String initial = splash;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesName.splash: (context) => const SplashScreen(),
    RoutesName.home: (context) =>  HomeScreen(),
  };
}

class RoutesName{
  static const String splash = '/splash';
  static const String home = '/home';
}