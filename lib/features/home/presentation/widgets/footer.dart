import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  final AnimationController animationController;
  const Footer({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - _screenUtil.setWidth(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAnimation(
              animationController: animationController,
              playAnimation: false,
              customAnimationType: CustomAnimationType.leftToRight,
              widget: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/linkedin.svg",
                    width: _screenUtil.setWidth(12),
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    width: _screenUtil.setWidth(15),
                  ),
                  SvgPicture.asset(
                    "assets/images/github.svg",
                    width: _screenUtil.setWidth(12),
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    width: _screenUtil.setWidth(15),
                  ),
                  SvgPicture.asset(
                    "assets/images/instagram.svg",
                    width: _screenUtil.setWidth(12),
                    color: AppColor.grey,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomAnimation(
              animationController: animationController,
              playAnimation: false,
              customAnimationType: CustomAnimationType.rightToLeft,
              widget: SvgPicture.asset(
                "assets/images/arrow-right.svg",
                width: _screenUtil.setWidth(35),
                color: AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
