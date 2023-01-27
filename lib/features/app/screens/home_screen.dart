import 'package:flutter/material.dart';
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
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Called");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              MainHeader(
                selectedIndex: 0,
                onTapMenu: () {
                  SideBar.open(context);
                },
              ),
              Flexible(
                flex: 1,
                child: SelectionArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpacer(height: context.isSmall() ? 16 : 64),
                          _FirstRow(),
                          verticalSpacer(height: 24),
                          _SecondRow(),
                          verticalSpacer(height: 24),
                          _ThirdRow(),
                          verticalSpacer(height: 64),
                          Text(
                            "© 2023 Wagyufari, All Rights Reserved",
                            style: GoogleFonts.inter(
                                fontSize: 16, color: AppColors.textSecondary),
                          ),
                          verticalSpacer(height: 16)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SideBar(
            selectedIndex: 0,
          )
        ],
      ),
    );
  }
}

class _FirstRow extends StatelessWidget {
  const _FirstRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.screenSize();
    return context.isSmall()
        ? Column(
            children: [
              SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: ProfilePicture()),
              verticalSpacer(height: 16),
              SizedBox(width: size.width, child: Profile()),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1000),
                  height: size.height * 0.5,
                  child: Row(
                    children: [
                      Flexible(flex: 3, child: Profile()),
                      horizontalSpacer(width: 24),
                      Flexible(flex: 2, child: ProfilePicture()),
                    ],
                  ),
                ),
              ),
            ],
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
                child: Gear(boxSize: boxSize),
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1000),
                  height: boxSize.width == 0 ? size.height / 2 : boxSize.width,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: WidgetSize(
                              onChange: (s) {
                                setState(() {
                                  boxSize = s;
                                });
                              },
                              child: DzikirQu())),
                      horizontalSpacer(width: 24),
                      Flexible(
                        flex: 1,
                        child: Gear(
                          boxSize: boxSize,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

class Gear extends StatelessWidget {
  const Gear({Key? key, required this.boxSize}) : super(key: key);

  final Size boxSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.rootDelegate.toNamed(Routes.GEARS);
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
        width: boxSize.width,
        height: context.isSmall() ? null : boxSize.height,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              context.isSmall() ? verticalSpacer(height: 24) : Spacer(),
              AbsorbPointer(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  children: [
                    for (var gear in Dummy.gearsLite)
                      _buildImage(gear.imageName)
                  ],
                ),
              ),
            ],
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage("assets/dzikirqu.png"),
                fit: BoxFit.cover,
              ),
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
        borderRadius: BorderRadius.circular(24),
        child: AnimatedScale(
          scale: isHovering ? 1.1 : 1,
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isProfileHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (f) {
        setState(() {
          isProfileHovering = true;
        });
      },
      onExit: (f) {
        setState(() {
          isProfileHovering = false;
        });
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(context.isSmall()
                  ? 24
                  : context.isMedium()
                      ? 24
                      : 32),
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
                  context.isSmall() ? verticalSpacer(height: 16) : Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrlString(
                              "https://www.instagram.com/wagyufari/");
                        },
                        child: HoveringSocial(
                          name: "ig",
                        ),
                      ),
                      horizontalSpacer(width: 8),
                      InkWell(
                        onTap: () {
                          launchUrlString(
                              "https://www.linkedin.com/in/mayburger/");
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
              ),
            ),
          ],
        ),
      ),
    );
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
