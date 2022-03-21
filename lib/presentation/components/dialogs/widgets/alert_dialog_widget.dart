import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget(
      {Key? key,
      this.barrierDismissible = true,
      this.title,
      this.leftLabel,
      this.callBackLeft,
      this.contentPadding = EdgeInsets.zero,
      this.shape,
      required this.rightLabel,
      required this.callBackRight,
      required this.content,
      this.isRightSpotLight = true})
      : super(key: key);

  final String? title;
  final String? leftLabel;
  final Function? callBackLeft;
  final String rightLabel;
  final Function callBackRight;
  final bool isRightSpotLight;
  final bool barrierDismissible;
  final Widget content;
  final EdgeInsetsGeometry contentPadding;
  final double? shape;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.subtitle1;
    final btnStyle =
        Theme.of(context).textTheme.button?.copyWith(color: mPrimaryColor);

    return WillPopScope(
      onWillPop: () async => barrierDismissible,
      child: AlertDialog(
        contentPadding: contentPadding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shape ?? 12.w)),
        title: title != null
            ? Text(
                title!,
                style: titleStyle,
              )
            : null,
        content: content,
        actions: <Widget>[
          if (leftLabel != null && callBackLeft != null)
            TextButton(
              onPressed: () => callBackLeft!(),
              child: Text(
                leftLabel!,
                style: isRightSpotLight
                    ? btnStyle?.copyWith(fontWeight: FontWeight.normal)
                    : btnStyle,
              ),
            ),
          TextButton(
            onPressed: () => callBackRight(),
            child: Text(
              rightLabel,
              style: btnStyle,
            ),
          ),
        ],
      ),
    );
  }
}
