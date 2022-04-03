import 'dart:async';

import 'package:aliakbar/core/animation/custom_animation.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Menu extends StatefulWidget {
  final AnimationController animationController;
  const Menu({Key? key, required this.animationController}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static const double _size = 12;
  final ValueNotifier<bool> _colorChangeNotifire = ValueNotifier(false);
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        _colorChangeNotifire.value = !_colorChangeNotifire.value;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _isHover.dispose();
    _colorChangeNotifire.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return CustomAnimation(
      animationController: widget.animationController,
      playAnimation: false,
      customAnimationType: CustomAnimationType.rightToLeft,
      widget: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          _isHover.value = true;
        },
        onExit: (_) {
          _isHover.value = false;
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: _isHover,
          builder: (BuildContext context, bool isHover, Widget? child) =>
              Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..scale(isHover ? 1.1 : 1.0, isHover ? 1.1 : 1.0),
            child: Tapped(
              onTap: () {},
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
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(
                          horizontal: _screenUtil.setWidth(3.5),
                        ),
                        height: _screenUtil.setWidth(_size),
                        width: _screenUtil.setWidth(_size),
                        decoration: BoxDecoration(
                          color: isHover ? AppColor.textColor : AppColor.grey,
                          borderRadius: BorderRadius.circular(
                            _screenUtil.setWidth(2),
                          ),
                        ),
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
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(
                          horizontal: _screenUtil.setWidth(3.5),
                        ),
                        height: _screenUtil.setWidth(_size),
                        width: _screenUtil.setWidth(_size),
                        decoration: BoxDecoration(
                          color: isHover ? AppColor.textColor : AppColor.grey,
                          borderRadius: BorderRadius.circular(
                            _screenUtil.setWidth(2),
                          ),
                        ),
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
      ),
    );
  }
}
