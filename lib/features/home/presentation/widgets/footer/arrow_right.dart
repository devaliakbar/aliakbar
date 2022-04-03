import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ArrowRight extends StatefulWidget {
  const ArrowRight({Key? key}) : super(key: key);

  @override
  State<ArrowRight> createState() => _ArrowRightState();
}

class _ArrowRightState extends State<ArrowRight>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<Offset> _offset;
  late Animation<double> _opacityAnimation;

  bool isFromLeft = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    Animation<double> _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    Offset offset = const Offset(1, 0);

    _offset = Tween(begin: const Offset(0, 0), end: offset).animate(_curve);
    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_curve);

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (isFromLeft) {
          isFromLeft = false;

          await Future.delayed(const Duration(milliseconds: 500));
          offset = const Offset(2, 0);
          _offset =
              Tween(begin: const Offset(0, 0), end: offset).animate(_curve);
          _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_curve);
          _animationController.reset();
          _animationController.forward();
        } else {
          isFromLeft = true;
          offset = const Offset(-1, 0);
          _offset =
              Tween(begin: offset, end: const Offset(0, 0)).animate(_curve);
          _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);
          _animationController.reset();
          _animationController.forward();
        }
      }
    });

    Future.delayed(const Duration(milliseconds: 3500)).then((value) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: _offset,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: SvgPicture.asset(
              "assets/images/arrow-right.svg",
              width: ScreenUtil().setWidth(35),
              color: AppColor.grey,
            ),
          ),
        );
      },
    );
  }
}
