import 'package:base_flutter/commons/constants/platform_layout_constants.dart';
import 'package:flutter/material.dart';

/// Based design
class BigTitleLayout extends StatelessWidget
    implements PlatformLayoutConstants {
  const BigTitleLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: PlatformLayoutConstants.marginBigTitleLayout),
        child: child,
      ),
    );
  }
}
