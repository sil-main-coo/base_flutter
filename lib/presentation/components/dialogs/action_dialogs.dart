import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/alert_dialog_widget.dart';

class ActionDialogs {
  static void show(
      {required BuildContext context,
      bool barrierDismissible = true,
      String? title,
      required String message,
      String? leftLabel,
      Function? callBackLeft,
      required String rightLabel,
      required Function callBackRight,
      bool isRightSpotLight = true}) {
    final messageStyle = Theme.of(context).textTheme.bodyText1;
    final content = Text(
      message,
      style: messageStyle,
    );

    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => AlertDialogWidget(
              callBackRight: callBackRight,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.h),
              content: content,
              rightLabel: rightLabel,
              title: title,
              barrierDismissible: barrierDismissible,
              callBackLeft: callBackLeft,
              leftLabel: leftLabel,
              isRightSpotLight: isRightSpotLight,
            ));
  }
}
