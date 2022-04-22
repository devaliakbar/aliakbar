import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/home/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void onInitialAnimationDone() {}

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _screenUtil.setWidth(30),
              vertical: _screenUtil.setWidth(20),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    _screenUtil.setWidth(40),
              ),
              child: Landing(
                onInitialAnimationDone: onInitialAnimationDone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
