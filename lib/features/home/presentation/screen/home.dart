import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/footer/footer.dart';
import 'package:aliakbar/features/home/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController topAnimation,
      bottomAnimation,
      optionsAnimation;

  @override
  void initState() {
    super.initState();

    topAnimation = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    bottomAnimation = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    optionsAnimation = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    Future.delayed(
      const Duration(milliseconds: 1500),
    ).then((value) => topAnimation.forward().whenComplete(() => bottomAnimation
        .forward()
        .whenComplete(() => optionsAnimation.forward())));
  }

  @override
  void dispose() {
    topAnimation.dispose();
    bottomAnimation.dispose();

    super.dispose();
  }

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
            child: Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        _screenUtil.setWidth(40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomAnimation(
                              animationController: topAnimation,
                              playAnimation: false,
                              customAnimationType:
                                  CustomAnimationType.topToBottom,
                              widget: Text(
                                "Ali Akbar",
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(170),
                                    letterSpacing: -1 * _screenUtil.setWidth(5),
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Menu(animationController: optionsAnimation),
                        ],
                      ),
                      CustomAnimation(
                        animationController: bottomAnimation,
                        playAnimation: false,
                        customAnimationType: CustomAnimationType.bottomToTop,
                        widget: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                "Full",
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(170),
                                    letterSpacing: -1 * _screenUtil.setWidth(5),
                                    height: 1,
                                  ),
                                ),
                              ),
                              Container(
                                color: AppColor.grey,
                                height: _screenUtil.setWidth(17),
                                width: _screenUtil.setWidth(100),
                              ),
                              Text(
                                "stack dev",
                                style: GoogleFonts.bebasNeue(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(170),
                                    letterSpacing: -1 * _screenUtil.setWidth(5),
                                    height: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Footer(
                  animationController: optionsAnimation,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
