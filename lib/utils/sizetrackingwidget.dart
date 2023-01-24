import 'package:flutter/material.dart';

class SizeTrackingWidget extends StatefulWidget {
  const SizeTrackingWidget({Key? key, required this.child, required this.sizeValueNotifier}) : super(key: key);

  final Widget child;
  final ValueNotifier<Size> sizeValueNotifier;

  @override
  State<SizeTrackingWidget> createState() => _SizeTrackingWidgetState();
}

class _SizeTrackingWidgetState extends State<SizeTrackingWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getSize();
    });
  }

  _getSize() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    widget.sizeValueNotifier.value = renderBox.size;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
