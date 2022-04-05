import 'dart:async';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCloseButton extends StatefulWidget {
  const AnimatedCloseButton({Key? key}) : super(key: key);

  @override
  State<AnimatedCloseButton> createState() => _AnimatedCloseButtonState();
}

class _AnimatedCloseButtonState extends State<AnimatedCloseButton>
    with SingleTickerProviderStateMixin {
  static const double _size = 12;
  final ValueNotifier<bool> _colorChangeNotifire = ValueNotifier(false);
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  late final Timer _timer;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1)).then((value) {
      _timer = Timer.periodic(const Duration(milliseconds: 600), (_) {
        _colorChangeNotifire.value = !_colorChangeNotifire.value;
      });
    });

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _timer.cancel();
    _isHover.dispose();
    _colorChangeNotifire.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        _controller.forward();
        _isHover.value = true;
      },
      onExit: (_) {
        _controller.reverse();
        _isHover.value = false;
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, child) => Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..scale(_animation.value, _animation.value),
            child: child),
        child: ValueListenableBuilder<bool>(
          valueListenable: _isHover,
          builder: (BuildContext context, bool isHover, Widget? child) =>
              Tapped(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                      decoration: BoxDecoration(
                        color: isHover ? AppColor.textColor : AppColor.grey,
                        borderRadius: BorderRadius.circular(
                          _screenUtil.setWidth(2),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: _screenUtil.setWidth(3.5),
                      ),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                      decoration: BoxDecoration(
                        color: isHover ? AppColor.textColor : AppColor.grey,
                        borderRadius: BorderRadius.circular(
                          _screenUtil.setWidth(2),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _colorChangeNotifire,
                      builder:
                          (BuildContext context, bool value, Widget? child) =>
                              AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.all(
                          _screenUtil.setWidth(3.5),
                        ),
                        height: _screenUtil.setWidth(_size),
                        width: _screenUtil.setWidth(_size),
                        decoration: BoxDecoration(
                          color: (value || isHover)
                              ? AppColor.textColor
                              : AppColor.grey,
                          borderRadius: BorderRadius.circular(
                            _screenUtil.setWidth(2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                      decoration: BoxDecoration(
                        color: isHover ? AppColor.textColor : AppColor.grey,
                        borderRadius: BorderRadius.circular(
                          _screenUtil.setWidth(2),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: _screenUtil.setWidth(3.5),
                      ),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _screenUtil.setWidth(_size),
                      width: _screenUtil.setWidth(_size),
                      decoration: BoxDecoration(
                        color: isHover ? AppColor.textColor : AppColor.grey,
                        borderRadius: BorderRadius.circular(
                          _screenUtil.setWidth(2),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
