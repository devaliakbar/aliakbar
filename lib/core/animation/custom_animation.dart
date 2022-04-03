import 'package:flutter/material.dart';

///FOR BASIC ANIMATIONS

enum CustomAnimationType {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  fadeIn,
}

class CustomAnimation extends StatefulWidget {
  final Widget widget;
  final CustomAnimationType customAnimationType;
  final bool opacityEffectForSlideAnimation;
  final Duration animationDuration;
  final AnimationController? animationController;
  final bool playAnimation;
  final bool showWidgetWithoutAnimation;
  final Function? onAnimationComplete;

  const CustomAnimation({
    Key? key,
    required this.widget,
    required this.customAnimationType,
    this.opacityEffectForSlideAnimation = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationController,
    this.playAnimation = true,
    this.showWidgetWithoutAnimation = false,
    this.onAnimationComplete,
  })  : assert(playAnimation || animationController != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomAnimationState();
  }
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Offset>? _offset;
  Animation<double>? _opacityAnimation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.animationController != null) {
      _controller = widget.animationController!;
    } else {
      ///IF THERE IS NO CONTYROLLER PASSED, SET UP CONTROLLER HERE
      _controller =
          AnimationController(duration: widget.animationDuration, vsync: this);
    }

    Animation<double> _curve =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onAnimationComplete != null) {
          widget.onAnimationComplete!();
        }
      }
    });

    Offset offset = const Offset(1, 0);
    if (widget.customAnimationType == CustomAnimationType.leftToRight) {
      offset = const Offset(-1, 0);
    } else if (widget.customAnimationType == CustomAnimationType.topToBottom) {
      offset = const Offset(0, -1);
    } else if (widget.customAnimationType == CustomAnimationType.bottomToTop) {
      offset = const Offset(0, 1);
    }

    if (widget.showWidgetWithoutAnimation) {
      ///IF WE DON'T NEED ANIMATION DURING FIRST TIME,AND ONLY NEED REVERSE ANIMATION, FIRST WE PERFORM
      ///ANIMATION WITHOUT ANY EFFECT, ONCE THAT COMPLETE ASSIGN REAL ANIMATION BEHAVIOUR TO THE CONTROLLER
      _offset = Tween(begin: const Offset(0, 0), end: const Offset(0, 0))
          .animate(_curve);

      _controller.forward().whenComplete(() {
        _offset = Tween(begin: offset, end: const Offset(0, 0)).animate(_curve);
      });
    } else {
      if (widget.customAnimationType == CustomAnimationType.fadeIn) {
        _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);
      } else {
        _offset = Tween(begin: offset, end: const Offset(0, 0)).animate(_curve);

        if (widget.opacityEffectForSlideAnimation) {
          _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_curve);
        }
      }
    }

    if (widget.playAnimation && !widget.showWidgetWithoutAnimation) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        if (widget.customAnimationType != CustomAnimationType.fadeIn) {
          return SlideTransition(
            position: _offset!,
            child: _opacityAnimation == null
                ? widget.widget
                : Opacity(
                    opacity: _opacityAnimation!.value,
                    child: widget.widget,
                  ),
          );
        }

        return Opacity(
          opacity: _opacityAnimation!.value,
          child: widget.widget,
        );
      },
    );
  }
}
