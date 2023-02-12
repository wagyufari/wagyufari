import 'dart:ui';
import 'package:equatable/equatable.dart';

class Dummy {
  static List<Gear> gears = [
    Gear("Macbook", "Macbook Air with M1 Apple Silicon Chip 256GB 2020",
        "mbam1.png"),
    Gear("Macbook Stand", "Adjustable Vertical Laptop Holder Alumunium",
        "mbstand.png"),
    Gear(
        "Xiaomi 34",
        "Xiaomi Mi Curved Gaming Monitor 34 Inch Ultra Wide 144Hz FreeSync WQHD",
        "xiaomi34.png"),
    Gear(
        "Xiaomi 27",
        "Xiaomi Professional Monitor 27 Inch 4K IPS 60 Hz USB Type C Ultra HD",
        "xiaomi4k.png"),
    Gear(
        "MX Master 3",
        "Logitech MX Master 3 Wireless Bluetooth Mouse - Graphite",
        "mxmaster.png"),
    Gear(
        "MX Keys",
        "Logitech MX Keys Wireless Illuminated Keyboard Bluetooth Multi Device",
        "mxkeys.png"),
    Gear("Standing Desk", "Adjustable Electric Working Desk from AFW",
        "standingdesk.png"),
    Gear(
        "Monitor Arm",
        "Lumi Single Monitor Premium Slim Aluminum Spring-assisted Monitor Arm",
        "lumiarm.png"),
    Gear(
        "Razer Headset",
        "Razer Barracuda X - Wireless Multi-platform Gaming and Mobile Headset",
        "razerbarx.png"),
    Gear(
        "Docking Station",
        "Lention 5k Usb C & Usb A Docking Station Hub Hdmi Displayport Dual 4k",
        "lention.png"),
    Gear(
        "Poco F3",
        "XIAOMI POCO F3 8/256GB NFC Snapdragon™ 870 48MP 4520mAh HP Android - Night Black",
        "pocof3.png"),
    Gear("iPhone", "Apple iPhone 12 Pro Max, 128GB", "iphone12.png"),
    Gear(
        "Ultimo",
        "Pexio Ultimo Ergonomic Office Chair with Highly Adjustable Armrest",
        "ultimo.png"),
    Gear(
        "Leband",
        "Leband Ergonomic Adjustable Backrest for Office Chair + Cover",
        "leband.png"),
  ];

  static List<Gear> getGears(int count) {
    return gears.getRange(0, count + 1).toList();
  }

  static List<Work> works = [
    Work(
        "Mentionable Text Field",
        "A TextField that supports @ detection and # detection and insert it as an NSTextAttachment Image",
        [
          "assets/mention1.gif",
          "assets/mention2.gif"
        ]),
    Work("UITableView Tree", "Enabling expand/collapse on a single UITableView using a One-Dimensional Array which supports Multiple-Alignment", [
      "assets/tree1.gif",
      "assets/tree2.gif",
    ]),
    Work("Drag & Drop Kanban", "Drag and Drop feature in a UITableView", [
      "assets/drag1.gif",
      "assets/drag2.gif",
    ]),
    Work("Intro Popups", "Intro popups for first time users", [
      "assets/intro1.gif",
      "assets/intro3.gif",
    ]),
    Work("Bottom Sheets", "Uses UIPanGestureRecognizer", [
      "assets/sheet3.gif",
      "assets/sheet2.gif",
    ]),
    Work("Charts", "Chart which shows user's progress over time. Also has custom balloon with XY Offset handling. Uses the charts library by Daniel Gindi", [
      "assets/charts1.gif",
      "assets/charts2.gif",
    ]),
  ];
}

class Gear extends Equatable {
  final String name;
  final String description;
  final String imageName;
  bool? isPlaceholder = false;

  Gear(this.name, this.description, this.imageName,
      [this.isPlaceholder = false]);

  @override
  List<Object?> get props => [name, description, imageName, isPlaceholder];
}

class Work extends Equatable {
  final String name;
  final String description;
  final List<String> imageGifs;

  Work(this.name, this.description, this.imageGifs);

  @override
  List<Object?> get props => [name, description, imageGifs];
}
