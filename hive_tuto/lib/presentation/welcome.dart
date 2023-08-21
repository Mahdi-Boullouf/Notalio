import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_tuto/config/routes/app_routes.dart';
import 'package:hive_tuto/core/res/assets_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
              ),
              Image.asset(
                AssetsManager.welcome,
                width: 140.w,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'N O T A L I O',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.h,
              ),
              FilledButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.home),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white70),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
