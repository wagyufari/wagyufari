import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/bloc/global_bloc.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/responsive_widget.dart';
import 'package:get/get.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;

  @override
  State<SideBar> createState() => _SideBarState();

  static String STATE_OPEN = "side_bar.openSideBar";
  static String STATE_CLOSED = "side_bar.closeSideBar";

  static void open(BuildContext context) {
    RxBus.send(context, STATE_OPEN);
  }

  static void close(BuildContext context) {
    RxBus.send(context, STATE_CLOSED);
  }
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  Animation<double>? slideAnimation;
  Animation<double>? alphaAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(
      listener: (context, state) {
        if (state is PushState) {
          controller.reset();
          double endWidth = context.screenSize().width * 0.8;
          bool isOpen = state.identifier == SideBar.STATE_OPEN;
          slideAnimation = Tween<double>(
                  begin: isOpen ? 0 : endWidth, end: isOpen ? endWidth : 0)
              .animate(
                  CurvedAnimation(parent: controller, curve: Curves.easeOut))
            ..addListener(() {
              setState(() {});
            });
          alphaAnimation = Tween<double>(
                  begin: isOpen ? 0 : 0.2, end: isOpen ? 0.2 : 0)
              .animate(
                  CurvedAnimation(parent: controller, curve: Curves.easeOut))
            ..addListener(() {
              setState(() {});
            });
          print("${state.identifier} ${isOpen}");
          controller.forward();
        }
      },
      builder: (context, state) {
        return Container(
          width: (slideAnimation?.value == null || slideAnimation?.value == 0)
              ? 0
              : null,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Opacity(
                  opacity: alphaAnimation?.value ?? 0,
                  child: GestureDetector(
                    onTap: () {
                      SideBar.close(context);
                    },
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SideBar.close(context);
                },
                child: Opacity(
                  opacity: ((alphaAnimation?.value ?? 0) * 5),
                  child: Container(
                    width: slideAnimation?.value,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpacer(height: 64),
                        buildItem("Home", 0, Routes.HOME),
                        verticalSpacer(height: 24),
                        buildItem("Gears", 1, Routes.GEARS),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildItem(String name, int index, String route) => GestureDetector(
    onTap: (){
        if(index != widget.selectedIndex){
          Get.rootDelegate.toNamed(route);
        }
        SideBar.close(context);
    },
    child: Text(
          name,
          style: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 32,
              fontWeight: widget.selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal),
        ),
  );
}
