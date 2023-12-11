import 'package:flutter/material.dart';
import 'package:movie_app/interface/screens/tabs/home/home.dart';
import 'package:movie_app/interface/utils/app_assets.dart';
import 'package:movie_app/interface/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset(AppAssets.splashLogo)),
    );
  }
}
