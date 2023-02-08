import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/indexed.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/screens/main_header.dart';
import 'package:wagyufari/features/app/screens/side_bar.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/dummy.dart';
import 'package:wagyufari/utils/responsive_widget.dart';
import 'package:wagyufari/utils/widget_size.dart';

class GearsScreen extends StatelessWidget {
  const GearsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                MainHeader(
                  selectedIndex: 1,
                  onTapMenu: () {
                    SideBar.open(context);
                  },
                ),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        context.isSmall()
                            ? Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: buildColumn(),
                                ))
                            : Container(
                                constraints: BoxConstraints(maxWidth: 1000),
                                child: buildColumn(),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SideBar(
              selectedIndex: 1,
            )
          ],
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          verticalSpacer(height: 64),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: SizedBox(
              width: 64,
              height: 64,
              child: Image(image: AssetImage("assets/profile.jpeg")),
            ),
          ),
          verticalSpacer(height: 24),
          Text(
            "Muhammad Ghifari Yusuf",
            style: GoogleFonts.inter(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary),
          ),
          Text(
            "Native Android & iOS Engineer @ Happy5",
            style: GoogleFonts.inter(fontSize: 32, color: AppColors.textPrimary),
          ),
          verticalSpacer(height: 16),
          Text(
            "Purwakarta, Indonesia",
            style: GoogleFonts.inter(fontSize: 16, color: AppColors.textPrimary),
          ),
          verticalSpacer(height: 64),
          Container(
              constraints: BoxConstraints(maxHeight: 800),
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/setup.jpeg"),
                fit: BoxFit.cover,
              )),
        ],),
        verticalSpacer(height: 32),
        _Gears(),
        verticalSpacer(height: 32),
      ],
    );
  }
}

class _Gears extends StatelessWidget {
  const _Gears({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.isSmall() ? 16 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacer(height: 24),
            _GearsGrid(crossAxisCount: 3, gears: Dummy.gears)
          ],
        ),
      ),
    );
  }
}

class _GearsGrid extends StatelessWidget {
  const _GearsGrid({
    Key? key,
    required this.crossAxisCount,
    required this.gears,
  })
  // we only plan to use this with 1 or 2 columns
  : super(key: key);
  final int crossAxisCount;
  final List<Gear> gears;

  @override
  Widget build(BuildContext context) {

    List<TrackSize> trackSize = [];
    for (var i = 0; i < (gears.length / crossAxisCount).ceil(); i++) {
      trackSize.add(auto);
    }

    List<TrackSize> columnSize = [];
    for(var i = 0; i< crossAxisCount; i++){
      columnSize.add(1.fr);
    }

    return LayoutGrid(
      columnSizes: columnSize,
      rowSizes: trackSize,
      rowGap: context.isSmall() ? 12 : 24,
      columnGap: context.isSmall() ? 12 : 24,
      children: [for (var gear in gears) _buildGear(context.isSmall(), gear)],
    );
  }

  Widget _buildGear(bool isSmall, Gear gear) => gear.isPlaceholder == true
      ? Container()
      : Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral_300, width: 1),
              borderRadius: BorderRadius.circular(isSmall ? 8 : 16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isSmall ? 8 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                      height: 200,
                      child: Image(image: AssetImage("assets/${gear.imageName}"))),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.neutral_300,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: AppColors.neutral_50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${gear.name}",
                            style: GoogleFonts.inter(
                                color: AppColors.textPrimary,
                                fontSize: isSmall ? 14 : 18,
                                fontWeight: FontWeight.bold),
                          ),
                          verticalSpacer(height: 8),
                          Text(
                            "${gear.description}",
                            style: GoogleFonts.inter(
                                color: AppColors.textTertiary,
                                fontSize: isSmall ? 12 : 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}
