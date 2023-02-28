import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ViewUtils {
  static Divider riddleDivider = Divider(
    indent: 17,
    endIndent: 17,
    height: 3,
    thickness: .5,
    color: Colors.grey.shade400,
  );

  static Column defaultSizedBox = Column(
    children: [
      const SizedBox(height: 7),
      ViewUtils.riddleDivider,
      const SizedBox(height: 7),
    ],
  );

  static snackBar(BuildContext context, String msg) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
          message: msg,
          backgroundColor: const Color.fromARGB(255, 58, 76, 108)),
    );
  }
}

class GenerateDialog extends AlertDialog {
  GenerateDialog({
    super.key,
    required BuildContext context,
    required String title,
    required String cancelTitle,
    required String actTitle,
    required Function() onAct,
    Color actColor = Colors.red,
  }) : super(
          backgroundColor: Theme.of(context).cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(title,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18)),
          actions: [
            TextButton(
              key: const Key('cancel.button'),
              child:
                  Text(cancelTitle, style: const TextStyle(color: Colors.blue)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              style: GeneralButtonStyle(color: actColor, borderEnabled: false),
              onPressed: onAct,
              child: Text(actTitle, style: const TextStyle(color: Colors.red)),
            )
          ],
        );
}

class GeneralButtonStyle extends ButtonStyle {
  GeneralButtonStyle({
    Color color = Colors.black,
    Color backgroundColor = Colors.transparent,
    double radius = 0,
    double stroke = 1.5,
    bool borderEnabled = true,
    Size size = const Size(0, 40),
  }) : super(
          overlayColor: MaterialStateProperty.all(color.withOpacity(.1)),
          fixedSize: MaterialStateProperty.all(size),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                side: borderEnabled
                    ? BorderSide(color: color, width: stroke)
                    : BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
        );
}
