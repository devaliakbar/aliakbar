import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/features/home/presentation/widgets/footer.dart';
import 'package:aliakbar/features/home/presentation/widgets/menu.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _screenUtil.setWidth(30),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ali Akbar",
                          style: GoogleFonts.bebasNeue(
                            textStyle: TextStyle(
                              color: AppColor.grey,
                              fontSize: _screenUtil.setSp(170),
                              letterSpacing: -1 * _screenUtil.setWidth(5),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Full",
                              style: GoogleFonts.bebasNeue(
                                textStyle: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: _screenUtil.setSp(170),
                                  letterSpacing: -1 * _screenUtil.setWidth(5),
                                ),
                              ),
                            ),
                            Container(
                              color: AppColor.grey,
                              height: _screenUtil.setWidth(17),
                              width: _screenUtil.setWidth(100),
                            ),
                            Text(
                              "stack dev",
                              style: GoogleFonts.bebasNeue(
                                textStyle: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: _screenUtil.setSp(170),
                                  letterSpacing: -1 * _screenUtil.setWidth(5),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Menu(),
                    const Footer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
