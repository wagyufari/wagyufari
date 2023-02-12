import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/screens/main_header.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/dummy.dart';
import 'package:wagyufari/utils/responsive_widget.dart';

class CodingScreen extends StatelessWidget {
  const CodingScreen({Key? key}) : super(key: key);

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
                constraints: BoxConstraints(maxWidth: 1400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainHeader(),
                    _Works(crossAxisCount: context.isSmall() ? 1 : 2,),
                    verticalSpacer(height: 64)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Works extends StatelessWidget {
  const _Works({
    Key? key, required this.crossAxisCount,
  }) : super(key: key);

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {

    var works = Dummy.works;

    List<TrackSize> trackSize = [];
    for (var i = 0; i < (works.length / crossAxisCount).ceil(); i++) {
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
      children: [for (var work in works) _ItemWork(work: work)],
    );
  }
}

class _ItemWork extends StatelessWidget {
  const _ItemWork({
    Key? key,
    required this.work,
  }) : super(key: key);

  final Work work;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppTheme.boxTheme(32),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              work.name,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: AppTheme.textTitle1(context),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              work.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: AppTheme.textBody1(context),
                  color: AppColors.textTertiary),
            ),
            verticalSpacer(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var gif in (context.isMobile()
                    ? work.imageGifs.getRange(0, 2)
                    : work.imageGifs))
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        _buildImageGif(gif: gif, count: work.imageGifs.length),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _buildImageGif extends StatelessWidget {
  const _buildImageGif({
    Key? key,
    required this.gif,
    required this.count,
  }) : super(key: key);

  final String gif;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(context.isSmall() ? 24 : 36),
                boxShadow: AppTheme.boxShadow,
                border: Border.all(color: AppColors.neutral_400.withOpacity(0.4)),
                color: AppColors.neutral_200),
            child: Padding(
              padding: EdgeInsets.all(context.isSmall() ? 4 : 8),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(context.isSmall() ? 24-4 : 36-8),
                child: Container(
                    width: double.infinity,
                    child: Image(image: AssetImage(gif), fit: BoxFit.cover)),
              ),
            )),
      ),
    );
  }
}
