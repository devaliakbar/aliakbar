import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/hover_text.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenUtil.setWidth(30),
          vertical: _screenUtil.setWidth(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                HoverText(
                  text: "Menu",
                  textSize: _screenUtil.setSp(80),
                ),
                const Spacer(),
                Tapped(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: AppColor.grey,
                    size: _screenUtil.setSp(80),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              "Build with Flutter",
              style: GoogleFonts.bebasNeue(
                textStyle: TextStyle(
                  color: AppColor.grey,
                  fontSize: _screenUtil.setSp(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
