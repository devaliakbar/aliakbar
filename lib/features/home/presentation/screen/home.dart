import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<bool> _initialLoading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 1500),
    ).then((value) => _initialLoading.value = false);
  }

  @override
  void dispose() {
    _initialLoading.dispose();
    super.dispose();
  }

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
              child: ValueListenableBuilder<bool>(
                valueListenable: _initialLoading,
                builder:
                    (BuildContext context, bool initialLoading, Widget? child) {
                  if (initialLoading) {
                    return const SizedBox.shrink();
                  }

                  ///BODY
                  return Landing(
                    onInitialAnimationDone: onInitialAnimationDone,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
