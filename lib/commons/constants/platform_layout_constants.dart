import 'dart:io';

import 'package:base_flutter/presentation/app/styles/domain/export.dart';

class PlatformLayoutConstants {
  static final double marginBigTitleLayout =
      Platform.isIOS ? Dimens.width_32 : Dimens.width_24;
  static final double marginCompactLayout = Dimens.width_16;
}
