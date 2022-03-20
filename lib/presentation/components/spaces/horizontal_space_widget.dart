import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HSpace extends StatelessWidget {
  double width;

  HSpace({Key? key, required this.width}) : super(key: key);

  HSpace.init4({Key? key})
      : width = 4,
        super(key: key);

  HSpace.init8({Key? key})
      : width = 8,
        super(key: key);

  HSpace.init16({Key? key})
      : width = 16,
        super(key: key);

  HSpace.init32({Key? key})
      : width = 32,
        super(key: key);

  HSpace.init48({Key? key})
      : width = 48,
        super(key: key);

  HSpace.init64({Key? key})
      : width = 64,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
