import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/responsive_widget.dart';



class HoveringSocial extends StatefulWidget {
  const HoveringSocial({
    Key? key,
    required this.name, required this.url,
  }) : super(key: key);

  final String name;
  final String url;

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
    return InkWell(
      onTap: (){
        launchUrlString(widget.url);
      },
      child: MouseRegion(
          onHover: (f) {
            setState(() {
              isHovering = !context.isSmall();
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
          )),
    );
  }
}
