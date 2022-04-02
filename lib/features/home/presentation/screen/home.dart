import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Row(
                children: [
                  Container(
                    width: _screenUtil.setWidth(60),
                    margin: EdgeInsets.only(
                      right: _screenUtil.setWidth(40),
                    ),
                    height: MediaQuery.of(context).size.height,
                    color: AppColor.greyDark,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: _screenUtil.setHeight(50),
                                  left: _screenUtil.setWidth(15),
                                  right: _screenUtil.setWidth(15),
                                ),
                                child:
                                    Image.asset("assets/images/ali_icon.png"),
                              ),
                              SizedBox(
                                height: _screenUtil.setHeight(10),
                              ),
                              Text(
                                "Full Stack Developer",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _screenUtil.setHeight(30),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "About",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Skills",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Works",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Education",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Contact",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: _screenUtil.setHeight(25),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.grey,
                                    width: _screenUtil.setHeight(0.5),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Blog",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: _screenUtil.setSp(9),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: _screenUtil.setHeight(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                "assets/images/linkedin.svg",
                                width: _screenUtil.setWidth(7.5),
                                color: AppColor.grey,
                              ),
                              SvgPicture.asset(
                                "assets/images/github.svg",
                                width: _screenUtil.setWidth(7.5),
                                color: AppColor.grey,
                              ),
                              SvgPicture.asset(
                                "assets/images/instagram.svg",
                                width: _screenUtil.setWidth(7.5),
                                color: AppColor.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Akbar",
                              style: GoogleFonts.bebasNeue(
                                textStyle: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: _screenUtil.setSp(170),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: _screenUtil.setWidth(40)),
                              child: Column(
                                children: [
                                  Text(
                                    "Full Stack Developer",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: _screenUtil.setSp(8),
                                          letterSpacing: 3),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: _screenUtil.setHeight(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: _screenUtil.setWidth(15),
                                      vertical: _screenUtil.setWidth(7),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.textColor,
                                        width: _screenUtil.setHeight(1.5),
                                      ),
                                    ),
                                    child: Text(
                                      "Contact me!",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: AppColor.textColor,
                                            fontSize: _screenUtil.setSp(8),
                                            letterSpacing: 3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
