import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverText extends StatelessWidget {
  final String text;

  const HoverText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          for (int index = 0; index < text.length; index++)
            WidgetSpan(
              child: _CharWidget(
                text[index],
              ),
            )
        ],
      ),
    );
  }
}

class _CharWidget extends StatefulWidget {
  final String char;

  const _CharWidget(this.char);

  @override
  State<_CharWidget> createState() => _CharWidgetState();
}

class _CharWidgetState extends State<_CharWidget>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final ScreenUtil screenUtil = ScreenUtil();

  late final Animation<Color?> _colorAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _colorAnimation = ColorTween(begin: AppColor.grey, end: AppColor.textColor)
        .animate(_animationController);

    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _animationController.forward();
      },
      onExit: (_) {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, _) => Text(
          widget.char,
          style: GoogleFonts.bebasNeue(
            textStyle: TextStyle(
              color: _colorAnimation.value,
              fontSize: screenUtil.setSp(165),
              letterSpacing: -1 * screenUtil.setWidth(5),
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
