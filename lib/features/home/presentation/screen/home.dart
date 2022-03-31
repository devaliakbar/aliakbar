import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: _screenUtil.setWidth(40),
              ),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ali",
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        color: AppColor.grey,
                        fontSize: _screenUtil.setSp(170),
                      ),
                    ),
                  ),
                  Text(
                    "Akbar",
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        color: AppColor.grey,
                        fontSize: _screenUtil.setSp(170),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
