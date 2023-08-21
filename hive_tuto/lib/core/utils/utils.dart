import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showConfirmationDialog(BuildContext context, String title, String description,
    {required Function() okPressed}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      content: Text(description),
      actions: [
        TextButton(
            onPressed: okPressed,
            child: Text(AppLocalizations.of(context)!.ok)),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel))
      ],
    ),
  );
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 200.w,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 3,
                color: Colors.black12,
                spreadRadius: 4,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(8, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outlined,
            size: 45,
          ),
          Text(title)
        ],
      ),
    );
  }
}
