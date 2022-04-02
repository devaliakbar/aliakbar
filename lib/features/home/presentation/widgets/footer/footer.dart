import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/features/home/presentation/widgets/custom_icon_button.dart';
import 'package:aliakbar/features/home/presentation/widgets/footer/arrow_right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  final AnimationController animationController;
  const Footer({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAnimation(
          animationController: animationController,
          playAnimation: false,
          customAnimationType: CustomAnimationType.leftToRight,
          widget: Row(
            children: [
              CustomIconButton(
                onClick: () {},
                icon: "assets/images/linkedin.svg",
              ),
              SizedBox(
                width: _screenUtil.setWidth(15),
              ),
              CustomIconButton(
                onClick: () {},
                icon: "assets/images/github.svg",
              ),
              SizedBox(
                width: _screenUtil.setWidth(15),
              ),
              CustomIconButton(
                onClick: () {},
                icon: "assets/images/instagram.svg",
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomAnimation(
          animationController: animationController,
          playAnimation: false,
          customAnimationType: CustomAnimationType.rightToLeft,
          widget: const ArrowRight(),
        ),
      ],
    );
  }
}
