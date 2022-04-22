import 'package:aliakbar/core/animation/perspective_pageview.dart';
import 'package:aliakbar/core/theme/app_theme.dart';
import 'package:aliakbar/core/utils/utils.dart';
import 'package:aliakbar/features/home/presentation/widgets/app_drawer.dart/close_button.dart';
import 'package:aliakbar/features/home/presentation/widgets/app_drawer.dart/flutter_text.dart';
import 'package:aliakbar/features/home/presentation/widgets/hover_text.dart';
import 'package:aliakbar/features/home/presentation/widgets/tapped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  final int currentPage;

  const AppDrawer({Key? key, this.currentPage = 1}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late final PageController _titleController;

  @override
  void initState() {
    _titleController = PageController(initialPage: widget.currentPage);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: _screenUtil.setSp(70),
                    child: PageView(
                      controller: _titleController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        HoverText(
                          text: "Home",
                          textSize: 70,
                          letterSpacing: 4,
                        ),
                        HoverText(
                          text: "About",
                          textSize: 70,
                          letterSpacing: 4,
                        ),
                        HoverText(
                          text: "My Skills",
                          textSize: 70,
                          letterSpacing: 4,
                        ),
                        HoverText(
                          text: "Project",
                          textSize: 70,
                          letterSpacing: 4,
                        ),
                        HoverText(
                          text: "Contact me",
                          textSize: 70,
                          letterSpacing: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const AnimatedCloseButton(),
              ],
            ),
            Expanded(
              child: PerspectivePageView(
                currentPage: widget.currentPage,
                hasShadow: true,
                shadowColor: AppColor.grey.withOpacity(0.01),
                aspectRatio: PVAspectRatio.sixteenNine,
                onPageChange: (double page) {
                  _titleController.jumpTo(
                    Utils.reMap(
                      page,
                      inMin: 0.0,
                      inMax: 4.0,
                      outMin: _titleController.position.minScrollExtent,
                      outMax: _titleController.position.maxScrollExtent,
                    ),
                  );
                },
                children: [
                  for (int i = 0; i < 5; i++)
                    Tapped(
                      onTap: () {
                        debugPrint("Statement $i");
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
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
                          child: Image.asset(
                            "assets/images/home.png",
                            fit: BoxFit.fill,
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
                  "Build with ",
                  style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                      fontSize: _screenUtil.setSp(15),
                    ),
                  ),
                ),
                const FlutterText(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
