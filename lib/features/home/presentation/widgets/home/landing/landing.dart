import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/features/home/presentation/widgets/home/footer/footer.dart';
import 'package:aliakbar/features/home/presentation/widgets/home/landing/hyphen.dart';
import 'package:aliakbar/features/home/presentation/widgets/hover_text.dart';
import 'package:aliakbar/features/home/presentation/widgets/home/menu.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  final Function onInitialAnimationDone;
  const Landing({Key? key, required this.onInitialAnimationDone})
      : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  late final AnimationController topAnimation,
      bottomAnimation,
      menuAnimation,
      footerAnimation;

  @override
  void initState() {
    super.initState();

    topAnimation = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    bottomAnimation = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    menuAnimation = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    footerAnimation = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    Future.delayed(
      const Duration(milliseconds: 500),
    ).then((value) => topAnimation.forward().whenComplete(() => bottomAnimation
        .forward()
        .whenComplete(() => menuAnimation.forward().whenComplete(() =>
            footerAnimation
                .forward()
                .then((value) => widget.onInitialAnimationDone())))));
  }

  @override
  void dispose() {
    topAnimation.dispose();
    bottomAnimation.dispose();
    menuAnimation.dispose();
    footerAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomAnimation(
                animationController: topAnimation,
                playAnimation: false,
                customAnimationType: CustomAnimationType.fadeIn,
                widget: const HoverText(text: "Ali Akbar"),
              ),
            ),
            Menu(animationController: menuAnimation),
          ],
        ),
        CustomAnimation(
          animationController: bottomAnimation,
          playAnimation: false,
          customAnimationType: CustomAnimationType.fadeIn,
          widget: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HoverText(text: "Full"),
                Hyphen(),
                HoverText(text: "stack dev")
              ],
            ),
          ),
        ),
        Footer(
          animationController: footerAnimation,
        )
      ],
    );
  }
}
