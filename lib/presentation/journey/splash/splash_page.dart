import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_flutter/commons/utils/utils.dart';
import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _initialApplication() {
    BlocProvider.of<AuthCubit>(context).checkAuth();
  }

  @override
  void initState() {
    super.initState();
    Utils.afterBuild(_initialApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          Positioned(
              bottom: 24.h,
              child: Text(
                'Splash screen',
                style: Theme.of(context).textTheme.caption,
              ))
        ],
      ),
    );
  }
}
