import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_tuto/core/res/app_colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: null,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              AppColors.containersColor.withOpacity(0.1))),
      child: const CupertinoActivityIndicator(),
    );
  }
}
