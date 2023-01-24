import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagyufari/core/widgets/bloc/global_bloc.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/injection_container.dart';

class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold(
      {Key? key, required this.body, this.title, this.leading})
      : super(key: key);

  final Widget? body;
  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return _DefaultScaffold(
      title: title,
      leading: leading,
      body: body ?? Container(),
    );
  }
}

class PlatformTabScaffold extends StatelessWidget {
  const PlatformTabScaffold({Key? key, required this.title, this.leading, this.tab, required this.tabPages, required this.onPageSelected, required this.pageController}) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? tab;
  final List<Widget> tabPages;
  final ValueChanged<int> onPageSelected;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return _TabScaffold(title: title, leading: leading, tab: tab ?? Container(), tabPages: tabPages, onPageSelected: onPageSelected, pageController: pageController,);
  }
}


class _DefaultScaffold extends StatelessWidget {
  const _DefaultScaffold({
    Key? key,
    required this.title,
    required this.leading,
    required this.body,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isAndroid
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  (title != null)
                      ? _AppBar(
                          title: title!,
                          leading: leading,
                        )
                      : Container(),
                  Expanded(child: _Body(body: body)),
                ],
              ),
            )
          : CupertinoPageScaffold(
              backgroundColor: Colors.white,
              navigationBar: (title != null)
                  ? CupertinoNavigationBar(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      leading: leading != null ? leading : Text(""),
                      middle: Text(title!),
                    )
                  : null,
              child: Expanded(
                child: _Body(
                  body: body,
                ),
              ),),
    );
  }
}

class _TabScaffold extends StatefulWidget {
  _TabScaffold({
    Key? key,
    required this.title,
    required this.leading,
    required this.tab, required this.tabPages, required this.onPageSelected, required this.pageController
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget tab;
  final List<Widget> tabPages;
  final ValueChanged<int> onPageSelected;
  final PageController pageController;

  @override
  State<_TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<_TabScaffold> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isAndroid
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  _AppBar(
                    title: "${widget.title}",
                    leading: widget.leading,
                    tab: widget.tab,
                  ),
                  Expanded(child: _Body(body: TabBarView(children: widget.tabPages,))),
                ],
              ),
            )
          : CupertinoPageScaffold(
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  _CupertinoAppBar(
                    title: "${widget.title}",
                    leading: widget.leading,
                    tab: widget.tab,
                  ),
                  Expanded(
                    child: PageView(
                      controller: widget.pageController,
                      onPageChanged: widget.onPageSelected,
                      children: widget.tabPages,),
                  ),
                ],
              )),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar(
      {Key? key, required this.title, this.leading, this.tab})
      : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        bottom: false,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: leading,
                        ),
                        SizedBox(
                          width: leading == null ? 0 : 32,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 21),
                        )
                      ],
                    )
                  ],
                ),
              ),
              tab ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}

class _CupertinoAppBar extends StatelessWidget {
  const _CupertinoAppBar(
      {Key? key, required this.title, this.leading, required this.tab})
      : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.cupertinoGray),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Stack(
                children: [
                  leading != null
                      ? Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Icon(Icons.arrow_back_ios))
                      : Container(),
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
            tab ?? Container(),
            Container(
                decoration: BoxDecoration(color: AppColors.cupertinoDivider),
                child: SizedBox(
                  height: 0.6,
                ))
          ],
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalBloc(),
      child: Stack(
        children: [widget.body, _SnackBar(), _Loading()],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return state is LoadingState
            ? Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
                child: Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CupertinoActivityIndicator(
                                radius: 24,
                              ),
                            ))),
              )
            : Container();
      },
    );
  }
}

class _SnackBar extends StatefulWidget {
  const _SnackBar({Key? key}) : super(key: key);

  @override
  State<_SnackBar> createState() => _SnackBarState();
}

class _SnackBarState extends State<_SnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    offset = Tween<Offset>(begin: Offset(0.0, 0.4), end: Offset.zero)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(
      listener: (context, state) {
        if (state is SnackBarState) {
          controller.forward();
          controller.reverseDuration = Duration(milliseconds: 200);
          Future.delayed(
              const Duration(milliseconds: 1500), () => {controller.reverse()});
        }
      },
      builder: (context, state) {
        String message = "";
        if (state is SnackBarState) {
          message = state.message;
        }
        return SlideTransition(
          position: offset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Container(
                  decoration: BoxDecoration(color: AppColors.neutral_900),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 24,
                        bottom: MediaQuery.of(context).padding.bottom + 24),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
