import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wagyufari/core/widgets/bloc/global_bloc.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/features/app/screens/main_header.dart';
import 'package:wagyufari/features/app/screens/side_bar.dart';
import 'package:wagyufari/main.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/dummy.dart';
import 'package:wagyufari/utils/responsive_widget.dart';
import 'package:wagyufari/utils/widget_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 1400, minWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Logo(),
                    _FirstRow(),
                    verticalSpacer(height: 24),
                    _SecondRow()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wagyufari",
                  style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -4),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        "https://api.whatsapp.com/send?phone=087778792230");
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.neutral_300, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Reach Me",
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FirstRow extends StatefulWidget {
  const _FirstRow({Key? key}) : super(key: key);

  @override
  State<_FirstRow> createState() => _FirstRowState();
}

class _FirstRowState extends State<_FirstRow> {
  Size contentSize = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    return context.isLarge()
        ? Row(
            children: [
              profile(),
              context.isLarge() ? horizontalSpacer(width: 24) : Container(),
              context.isLarge()
                  ? Flexible(flex: 1, child: badge(context))
                  : Container()
            ],
          )
        : Row(
          children: [
            profile(),
          ],
        );
  }

  Widget badge(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral_50,
        border: Border.all(
          color: AppColors.neutral_300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      height: contentSize.height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: context.isSmall()
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: badges(),
              ),
      ),
    );
  }

  List<Widget> badges() {
    return [
      buildBadge(
          context, "assets/androidev.png", Colors.white, "Since October 2019"),
      verticalSpacer(height: 16),
      buildBadge(
          context, "assets/iosdev.png", Colors.black, "Since April 2021"),
      verticalSpacer(height: 16),
      buildBadge(
          context, "assets/flutterdev.png", Colors.white, "Since January 2023"),
    ];
  }

  Flexible profile() {
    return Flexible(
        flex: 3,
        child: WidgetSize(
            onChange: (size) {
              setState(() {
                contentSize = size;
              });
            },
            child: Profile()));
  }

  Widget buildBadge(
      BuildContext context, String image, Color color, String since) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: AppTheme.boxShadow),
              ),
            ),
          ),
          Column(
            children: [
              verticalSpacer(height: 8),
              Text(
                since,
                style: GoogleFonts.inter(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SecondRow extends StatefulWidget {
  const _SecondRow({Key? key}) : super(key: key);

  @override
  State<_SecondRow> createState() => _SecondRowState();
}

class _SecondRowState extends State<_SecondRow> {
  Size boxSize = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    Size size = context.screenSize();
    return context.isSmall()
        ? Column(
            children: [
              Container(
                height: boxSize.width == 0 ? size.width : boxSize.width,
                width: size.width,
                child: WidgetSize(
                    onChange: (s) {
                      setState(() {
                        boxSize = s;
                      });
                    },
                    child: DzikirQu()),
              ),
              verticalSpacer(height: 24),
              Container(
                width: size.width,
                child: Gear(),
              )
            ],
          )
        : Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(height: boxSize.height, child: DzikirQu()),
              ),
              horizontalSpacer(width: 24),
              Flexible(
                  flex: 2,
                  child: WidgetSize(
                      onChange: (size) {
                        setState(() {
                          boxSize = size;
                        });
                      },
                      child: Gear())),
            ],
          );
  }
}

class Gear extends StatelessWidget {
  const Gear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(Routes.GEARS);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.neutral_50,
            border: Border.all(
              color: AppColors.neutral_300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gears",
                        style: GoogleFonts.inter(
                            color: AppColors.textPrimary,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "All the things I use for my daily work as a Remote Software Engineer",
                        style: GoogleFonts.inter(
                            color: AppColors.textPrimary,
                            fontSize: context.isSmall()
                                ? 16
                                : context.isMedium()
                                    ? 18
                                    : 20),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(height: 24),
                Flexible(
                  flex: 1,
                  child: AbsorbPointer(
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      children: [
                        for (var gear in Dummy.gearsLite)
                          _buildImage(gear.imageName)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String name) => Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral_300, width: 1),
            borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(image: AssetImage("assets/${name}")),
          ),
        ),
      );
}

class DzikirQu extends StatefulWidget {
  const DzikirQu({
    Key? key,
  }) : super(key: key);

  @override
  State<DzikirQu> createState() => _DzikirQuState();
}

class _DzikirQuState extends State<DzikirQu> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlString("https://github.com/wagyufari/dzikirqu-android");
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (f) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (f) {
          setState(() {
            isHovering = false;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: AnimatedScale(
            scale: isHovering ? 1.1 : 1,
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            child: Image(
              image: AssetImage("assets/dzikirqu.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (f) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (f) {
        setState(() {
          isHovering = false;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: AnimatedScale(
          scale: isHovering ? 1.1 : 1,
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 500),
          child: Container(
            child: Image(
              image: AssetImage("assets/profile.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Size contentSize = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral_50,
        border: Border.all(
          color: AppColors.neutral_300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.isSmall()
            ? 24
            : context.isMedium()
                ? 24
                : 32),
        child: context.isSmall()
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profile(),
                  verticalSpacer(height: 24),
                  content(context)
                ],
              )
            : Row(
                children: [
                  Flexible(flex: 1, child: content(context)),
                  horizontalSpacer(width: 32),
                  profile()
                ],
              ),
      ),
    );
  }

  SizedBox profile() {
    return SizedBox(
        width: contentSize == 0
            ? 1
            : contentSize.height * (context.isSmall() ? 0.4 : 0.6),
        height: contentSize == 0
            ? 1
            : contentSize.height * (context.isSmall() ? 0.4 : 0.6),
        child: ProfilePicture());
  }

  WidgetSize content(BuildContext context) {
    return WidgetSize(
        onChange: (size) {
          setState(() {
            contentSize = size;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Muhammad Ghifari",
                  style: GoogleFonts.inter(
                      fontSize: context.isSmall()
                          ? 24
                          : context.isMedium()
                              ? 32
                              : 44,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold),
                ),
                horizontalSpacer(width: 8),
                SizedBox(
                    height: context.isSmall()
                        ? 24
                        : context.isMedium()
                            ? 30
                            : 36,
                    width: context.isSmall()
                        ? 20
                        : context.isMedium()
                            ? 30
                            : 36,
                    child: Image(
                      image: AssetImage("assets/apple_logo.png"),
                      color: Colors.black,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
            Text(
              "Mobile Engineer & UI/UX Enthusiast",
              style: GoogleFonts.inter(
                  fontSize: context.isSmall()
                      ? 20
                      : context.isMedium()
                          ? 22
                          : 24,
                  color: AppColors.textSecondary),
            ),
            verticalSpacer(height: 32),
            Text(
              "Native Android & iOS Engineer currently working at a SaaS company at Jakarta. Have been in the IT Industry for 3+ years, experienced in building complex applications and have a pretty good eye for design.",
              style: GoogleFonts.inter(
                fontSize: context.isSmall()
                    ? 16
                    : context.isMedium()
                        ? 18
                        : 20,
                color: AppColors.textTertiary,
              ),
            ),
            verticalSpacer(height: 64),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    launchUrlString("https://www.instagram.com/wagyufari/");
                  },
                  child: HoveringSocial(
                    name: "ig",
                  ),
                ),
                horizontalSpacer(width: 8),
                InkWell(
                  onTap: () {
                    launchUrlString("https://www.linkedin.com/in/mayburger/");
                  },
                  child: HoveringSocial(
                    name: "linkedin",
                  ),
                ),
                horizontalSpacer(width: 8),
                InkWell(
                  onTap: () {
                    launchUrlString("https://github.com/wagyufari");
                  },
                  child: HoveringSocial(
                    name: "github",
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class HoveringSocial extends StatefulWidget {
  const HoveringSocial({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<HoveringSocial> createState() => _HoveringSocialState();
}

class _HoveringSocialState extends State<HoveringSocial> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    double size = context.isSmall()
        ? 48
        : context.isMedium()
            ? 48
            : 64;
    return MouseRegion(
        onHover: (f) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (f) {
          setState(() {
            isHovering = false;
          });
        },
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: isHovering ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: SizedBox(
                  height: size,
                  width: size,
                  child: Image(
                      image: AssetImage("assets/${widget.name}_selected.png"))),
            ),
            AnimatedOpacity(
              opacity: isHovering ? 0 : 1,
              duration: Duration(milliseconds: 200),
              child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.neutral_300, width: 1)),
                  child: Image(image: AssetImage("assets/${widget.name}.png"))),
            ),
          ],
        ));
  }
}

class _ThirdRow extends StatelessWidget {
  const _ThirdRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.screenSize();
    return context.isSmall()
        ? Column(
            children: [],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: Row(
                    children: [
                      Flexible(flex: 1, child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

class Insta extends StatelessWidget {
  const Insta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlString("https://www.instagram.com/wagyufari/");
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.neutral_50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.neutral_300)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image(
                          image: AssetImage("assets/profile.jpeg"),
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCounts("Posts", 0),
                        _buildCounts("Followers", 420),
                        _buildCounts("Following", 356),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpacer(height: 12),
              Text(
                "Muhammad Ghifari",
                style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "محمدغفاري بن يوسف (٢٠٠١)",
                style: GoogleFonts.inter(
                    color: AppColors.textPrimary, fontSize: 16),
              ),
              Text(
                "Señor Software Engineer",
                style: GoogleFonts.inter(
                    color: AppColors.textPrimary, fontSize: 16),
              ),
              Text(
                "🇮🇩🇸🇦",
                style: GoogleFonts.inter(
                    color: AppColors.textPrimary, fontSize: 16),
              ),
              Text(
                "@mutiaraimanid @dzikirqu",
                style: GoogleFonts.inter(color: Colors.blue, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounts(String name, int count) {
    return Column(
      children: [
        Text(
          "${count}",
          style: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(
          name,
          style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 14),
        ),
      ],
    );
  }
}
