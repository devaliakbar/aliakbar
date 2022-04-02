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

class _CustomIconButtonState extends State<CustomIconButton> {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  final _screenUtil = ScreenUtil();

  @override
  void dispose() {
    _isHover.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        _isHover.value = true;
      },
      onExit: (_) {
        _isHover.value = false;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (BuildContext context, bool isHover, Widget? child) => Tapped(
          onTap: widget.onClick,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: _screenUtil.setWidth(15),
              minWidth: _screenUtil.setWidth(13),
            ),
            child: SvgPicture.asset(
              widget.icon,
              width: _screenUtil.setWidth(isHover ? 13 : 12),
              color: isHover ? AppColor.textColor : AppColor.grey,
            ),
          ),
        ),
      ),
    );
  }
}
