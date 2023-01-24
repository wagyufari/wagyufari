import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:wagyufari/core/widgets/indexed.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/globalkey_extensions.dart';
import 'dart:io';

import 'package:wagyufari/utils/sizetrackingwidget.dart';

class PlatformTabBar extends StatelessWidget {
  const PlatformTabBar(
      {Key? key,
      required this.tabTitles,
      this.onItemSelected,
      this.selectedIndex})
      : super(key: key);

  final List<String> tabTitles;
  final ValueChanged<int>? onItemSelected;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? _MaterialTabBar(tabTitles: tabTitles)
        : _CupertinoTabBar(
            tabTitles: tabTitles,
            selectedIndex: selectedIndex!,
            onItemSelected: onItemSelected!,
          );
  }
}

class _CupertinoTabBar extends StatefulWidget {
  _CupertinoTabBar(
      {Key? key,
      required this.tabTitles,
      required this.onItemSelected,
      required this.selectedIndex})
      : super(key: key);

  final List<String> tabTitles;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  @override
  State<_CupertinoTabBar> createState() => _CupertinoTabBarState();
}

class _CupertinoTabBarState extends State<_CupertinoTabBar> {
  late ScrollController _controller;

  Map<int, Rect?> tabRect = HashMap();
  final ValueNotifier<double> scrollOffset = ValueNotifier(0);
  var scrollingToIndex = -1;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  void handleItemSelected(int index) {
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    scrollToIndex(widget.selectedIndex);
    return SizedBox(
        height: 38,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notif) {
            scrollOffset.value = notif.metrics.pixels;
            return true;
          },
          child: ValueListenableBuilder(
              valueListenable: scrollOffset,
              builder: (context, offset, _) {
                return ListView.builder(
                    itemCount: widget.tabTitles.length,
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          handleItemSelected(index);
                        },
                        child: _CupertinoTab(
                          title: widget.tabTitles[index],
                          isSelected: index == widget.selectedIndex,
                          positionOnScreen: (rect) {
                            tabRect[index] = rect;
                          },
                        ),
                      );
                    });
              }),
        ));
  }

  void scrollToIndex(int index) async {
    var right = tabRect[index]?.right;
    var left = tabRect[index]?.left;
    if (right != null && left != null) {
      if (right > MediaQuery.of(context).size.width) {
        scrollOffset.value = scrollOffset.value + 1;
        _controller.jumpTo(scrollOffset.value + 1);
        Future.delayed(const Duration(milliseconds: 2), () {
          scrollToIndex(index);
        });
      } else if(left < 0){
        scrollOffset.value = scrollOffset.value - 1;
        _controller.jumpTo(scrollOffset.value - 1);
        Future.delayed(const Duration(milliseconds: 2), () {
          scrollToIndex(index);
        });
      }
    }
  }
}

class _CupertinoTab extends StatefulWidget {
  const _CupertinoTab(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.positionOnScreen})
      : super(key: key);

  final String title;
  final bool isSelected;
  final ValueChanged<Rect?> positionOnScreen;

  @override
  State<_CupertinoTab> createState() => _CupertinoTabState();
}

class _CupertinoTabState extends State<_CupertinoTab> {
  ValueNotifier<Size> _size = ValueNotifier<Size>(Size(0, 0));
  GlobalKey key = GlobalKey(); // declare a global key

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _size,
        builder: (context, Size size, _) {
          widget.positionOnScreen(key.globalPaintBounds);
          return Column(
            key: key,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizeTrackingWidget(
                sizeValueNotifier: _size,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: widget.isSelected
                          ? AppColors.primary
                          : AppColors.textTertiary),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  color: widget.isSelected ? AppColors.primary : null,
                  child: SizedBox(
                    width: size.width + 32,
                    height: 2,
                  ))
            ],
          );
        });
  }
}

class _MaterialTabBar extends StatefulWidget {
  const _MaterialTabBar({Key? key, required this.tabTitles}) : super(key: key);

  final List<String> tabTitles;

  @override
  State<_MaterialTabBar> createState() => _MaterialTabBarState();
}

class _MaterialTabBarState extends State<_MaterialTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textTertiary,
        indicatorColor: AppColors.primary,
        isScrollable: true,
        tabs: widget.tabTitles
            .map((e) => Tab(
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 14),
                  ),
                ))
            .toList());
  }
}
