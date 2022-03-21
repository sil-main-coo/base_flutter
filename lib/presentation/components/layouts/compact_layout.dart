import 'package:base_flutter/commons/constants/platform_layout_constants.dart';
import 'package:flutter/material.dart';

/// Based design
class CompactLayout extends StatelessWidget implements PlatformLayoutConstants {
  const CompactLayout(
      {Key? key,
      required this.child,
      this.onlyPaddingVertical = false,
      this.disableScroll = false})
      : super(key: key);

  final Widget child;
  final bool onlyPaddingVertical;
  final bool disableScroll;

  @override
  Widget build(BuildContext context) {
    final widget = disableScroll
        ? Padding(
            padding: onlyPaddingVertical
                ? EdgeInsets.symmetric(
                    vertical: PlatformLayoutConstants.marginCompactLayout)
                : EdgeInsets.all(PlatformLayoutConstants.marginCompactLayout),
            child: child,
          )
        : SingleChildScrollView(
            physics: disableScroll
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            padding: onlyPaddingVertical
                ? EdgeInsets.symmetric(
                    vertical: PlatformLayoutConstants.marginCompactLayout)
                : EdgeInsets.all(PlatformLayoutConstants.marginCompactLayout),
            child: child,
          );

    return SafeArea(
      child: widget,
    );
  }
}
