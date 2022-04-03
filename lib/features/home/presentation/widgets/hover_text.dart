import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? hoverStyle;

  const HoverText(
      {Key? key, required this.text, this.textStyle, this.hoverStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          for (int index = 0; index < text.length; index++)
            WidgetSpan(
              child: _CharWidget(
                  char: text[index],
                  textStyle: textStyle,
                  hoverStyle: hoverStyle),
            )
        ],
      ),
    );
  }
}

class _CharWidget extends StatefulWidget {
  final String char;
  final TextStyle? textStyle;
  final TextStyle? hoverStyle;

  const _CharWidget(
      {required this.char, required this.textStyle, required this.hoverStyle});

  @override
  State<_CharWidget> createState() => _CharWidgetState();
}

class _CharWidgetState extends State<_CharWidget> with WidgetsBindingObserver {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  final ScreenUtil screenUtil = ScreenUtil();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle txtStyle;
    if (widget.textStyle != null) {
      txtStyle = widget.textStyle!;
    } else {
      txtStyle = GoogleFonts.bebasNeue(
        textStyle: TextStyle(
          color: AppColor.grey,
          fontSize: screenUtil.setSp(165),
          letterSpacing: -1 * screenUtil.setWidth(5),
          height: 1,
        ),
      );
    }

    final TextStyle hvrStyle;
    if (widget.hoverStyle != null) {
      hvrStyle = widget.hoverStyle!;
    } else {
      hvrStyle = GoogleFonts.bebasNeue(
        textStyle: TextStyle(
          color: AppColor.textColor,
          fontSize: screenUtil.setSp(165),
          letterSpacing: -1 * screenUtil.setWidth(5),
          height: 1,
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) {
        _isHover.value = true;
      },
      onExit: (_) {
        _isHover.value = false;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHover,
        builder: (BuildContext context, bool isHover, Widget? child) => Text(
          widget.char,
          style: isHover ? hvrStyle : txtStyle,
        ),
      ),
    );
  }
}
