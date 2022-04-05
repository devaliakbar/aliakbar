import 'package:aliakbar/core/animation/perspective_pageview.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/app_drawer.dart/close_button.dart';
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
        padding: EdgeInsets.only(
          left: _screenUtil.setWidth(30),
          right: _screenUtil.setWidth(30),
          top: _screenUtil.setWidth(20),
          bottom: _screenUtil.setWidth(10),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                HoverText(
                  text: "Menu",
                  textSize: 70,
                  letterSpacing: 4,
                ),
                Spacer(),
                AnimatedCloseButton(),
              ],
            ),
            Expanded(
              child: PerspectivePageView(
                hasShadow: true,
                shadowColor: AppColor.grey.withOpacity(0.01),
                aspectRatio: PVAspectRatio.sixteenNine,
                children: [
                  for (int i = 0; i < 5; i++)
                    Tapped(
                      onTap: () {
                        debugPrint("Statement $i");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.background,
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: AppColor.grey.withOpacity(0.1),
                              width: _screenUtil.setWidth(4),
                            ),
                            vertical: BorderSide(
                              color: AppColor.grey.withOpacity(0.1),
                              width: _screenUtil.setWidth(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: _screenUtil.setHeight(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Build with Flutter",
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                      fontSize: _screenUtil.setSp(16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
