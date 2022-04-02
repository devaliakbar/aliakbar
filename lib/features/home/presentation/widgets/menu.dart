import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  final AnimationController animationController;
  const Menu({Key? key, required this.animationController}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();
    return Positioned(
      right: 0,
      top: _screenUtil.setWidth(50),
      child: CustomAnimation(
        animationController: widget.animationController,
        playAnimation: false,
        customAnimationType: CustomAnimationType.rightToLeft,
        widget: SvgPicture.asset(
          "assets/images/menu.svg",
          color: AppColor.grey,
          width: _screenUtil.setSp(40),
        ),
      ),
    );
  }
}
