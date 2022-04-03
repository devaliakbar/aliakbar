import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatefulWidget {
  final String icon;
  final Function onClick;

  const CustomIconButton({Key? key, required this.icon, required this.onClick})
      : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  final _screenUtil = ScreenUtil();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    _isHover.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (BuildContext context, bool isHover, Widget? child) =>
            AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, child) => Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..scale(_animation.value, _animation.value),
            child: child,
          ),
          child: Tapped(
            onTap: widget.onClick,
            child: SvgPicture.asset(
              widget.icon,
              width: _screenUtil.setWidth(12),
              color: isHover ? AppColor.textColor : AppColor.grey,
            ),
          ),
        ),
      ),
    );
  }
}
