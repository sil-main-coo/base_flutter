import 'package:base_flutter/presentation/app/styles/domain/export.dart';
import 'package:base_flutter/presentation/components/spaces/horizontal_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String? label;
  final Gradient? gradient;
  final double width;
  final double? height;
  final Function()? onPressed;
  final Widget? child;
  final bool isLoading;
  final IconData? icon;

  const GradientButton({
    Key? key,
    this.label,
    this.gradient,
    this.icon,
    this.width = double.infinity,
    this.height,
    this.isLoading = false,
    this.child,
    this.onPressed,
  }) : super(key: key);

  const GradientButton.icon({
    Key? key,
    required this.label,
    this.gradient,
    required this.icon,
    this.width = double.infinity,
    this.height,
    this.isLoading = false,
    this.child,
    this.onPressed,
  }) : super(key: key);

  const GradientButton.loading(
      {Key? key,
      this.label,
      this.gradient,
      this.icon,
      this.width = double.infinity,
      this.height,
      this.isLoading = true,
      this.child,
      this.onPressed})
      : super(key: key);

  const GradientButton.done({
    Key? key,
    this.label,
    this.gradient,
    this.icon,
    this.width = double.infinity,
    this.height,
    this.isLoading = false,
    this.child = const Icon(
      Icons.check,
      size: 24,
      color: Colors.white,
    ),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      onPressed == null;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed == null ? null : onPressed!,
        child: Container(
            width: width,
            height: height ?? 44.0.h,
            padding: EdgeInsets.symmetric(vertical: Dimens.height_8),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius_4)),
                gradient: onPressed == null
                    ? null
                    : gradient ??
                        LinearGradient(
                          colors: [mPrimaryColor, mAccentColor],
                        ),
                color: onPressed == null ? mNoActiveColor : null),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 16.w,
                      width: 16.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: mAccentColor,
                        backgroundColor: Colors.white,
                      ))
                  : child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (icon != null)
                            Icon(
                              icon,
                              size: 18.w,
                              color: Colors.white,
                            ),
                          HSpace.init4(),
                          Text(
                            label!,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
            )),
      ),
    );
  }
}
