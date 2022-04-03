import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hyphen extends StatefulWidget {
  const Hyphen({Key? key}) : super(key: key);

  @override
  State<Hyphen> createState() => _HyphenState();
}

class _HyphenState extends State<Hyphen> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  void dispose() {
    _isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _isHover.value = true;
      },
      onExit: (_) {
        _isHover.value = false;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (BuildContext context, bool isHover, Widget? child) =>
            Container(
          color: isHover ? AppColor.textColor : AppColor.grey,
          height: _screenUtil.setWidth(17),
          width: _screenUtil.setWidth(100),
        ),
      ),
    );
  }
}
