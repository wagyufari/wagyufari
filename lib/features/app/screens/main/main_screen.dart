import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/responsive_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.screenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [BuildTop(context)],
          ),
        ),
      ),
    );
  }

  Widget BuildTop(BuildContext context) {
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
                  constraints: BoxConstraints(maxWidth: 1200),
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
                          child:
                              Image(image: AssetImage("assets/apple_logo.png"), color: Colors.black, fit: BoxFit.cover,))
                    ],
                  ),
                  Text(
                    "Software Engineer & UI/UX Enthusiast",
                    style: GoogleFonts.inter(
                        fontSize: context.isSmall()
                            ? 20
                            : context.isMedium()
                                ? 22
                                : 24,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600),
                  ),
                  verticalSpacer(height: 32),
                  Text(
                    "Native Android & iOS Engineer currently working at a SaaS company at Jakarta. Have been in the IT Industry for 3+ years, experienced in building complex applications and have a very good eye for design.",
                    style: GoogleFonts.inter(
                        fontSize: context.isSmall()
                            ? 16
                            : context.isMedium()
                                ? 18
                                : 20,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500),
                  ),
                  context.isSmall() ? verticalSpacer(height: 16) : Spacer(),
                  Row(
                    children: [
                      HoveringSocial(
                          name: "ig",),
                      horizontalSpacer(width: 8),
                      HoveringSocial(
                        name: "linkedin",),
                      horizontalSpacer(width: 8),
                      HoveringSocial(
                        name: "github",),
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
    double size = context.isSmall() ? 48 : context.isMedium() ? 48 : 64;
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
                  child: Image(image: AssetImage("assets/${widget.name}_selected.png"))),
            ),
            AnimatedOpacity(
              opacity: !isHovering ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.neutral_300, width: 1)),
                  child: Image(image: AssetImage("assets/${widget.name}.png"))),
            ),
          ],
        ));
  }
}
