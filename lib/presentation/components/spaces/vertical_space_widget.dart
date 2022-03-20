import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class VSpace extends StatelessWidget {
  double height;

  VSpace({Key? key, required this.height}) : super(key: key);

  VSpace.init4({Key? key})
      : height = 4,
        super(key: key);

  VSpace.init8({Key? key})
      : height = 8,
        super(key: key);

  VSpace.init16({Key? key})
      : height = 16,
        super(key: key);

  VSpace.init24({Key? key})
      : height = 24,
        super(key: key);

  VSpace.init32({Key? key})
      : height = 32,
        super(key: key);

  VSpace.init48({Key? key})
      : height = 48,
        super(key: key);

  VSpace.init64({Key? key})
      : height = 64,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}
