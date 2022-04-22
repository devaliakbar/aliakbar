import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hyphen extends StatefulWidget {
  const Hyphen({Key? key}) : super(key: key);

  @override
  State<Hyphen> createState() => _HyphenState();
}

class _HyphenState extends State<Hyphen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final ScreenUtil _screenUtil = ScreenUtil();
  late final Animation<Color?> _colorAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _colorAnimation = ColorTween(begin: AppColor.grey, end: AppColor.textColor)
        .animate(_animationController);
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _animationController.forward();
      },
      onExit: (_) {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, _) => Container(
          color: _colorAnimation.value,
          height: _screenUtil.setWidth(17),
          width: _screenUtil.setWidth(100),
        ),
      ),
    );
  }
}
