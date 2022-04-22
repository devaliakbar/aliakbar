import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterText extends StatefulWidget {
  const FlutterText({Key? key}) : super(key: key);

  @override
  State<FlutterText> createState() => _FlutterTextState();
}

class _FlutterTextState extends State<FlutterText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double>? _opacityAnimation;

  final ValueNotifier<bool> _isHover = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_opacityAnimation?.value == 1) {
          _animationController.reverse().then((value) {
            _animationController.reset();
            _animationController.forward();
          });
        }
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _isHover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tapped(
      onTap: () async {
        await launch("https://flutter.dev/");
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          _isHover.value = true;
        },
        onExit: (_) {
          _isHover.value = false;
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, _) => ValueListenableBuilder(
            valueListenable: _isHover,
            builder: (BuildContext context, bool isHover, Widget? child) =>
                Text(
              "Flutter",
              style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(
                  color: AppColor.textColor
                      .withOpacity(isHover ? 1 : _opacityAnimation!.value),
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
