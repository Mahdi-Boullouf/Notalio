import 'package:flutter/material.dart';
import 'package:hive_tuto/core/res/app_colors.dart';

class DisabledButton extends StatelessWidget {
  const DisabledButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: null,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              AppColors.containersColor.withOpacity(0.1))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white30),
      ),
    );
  }
}
