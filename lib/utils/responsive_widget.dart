import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

extension Responsive on BuildContext{
  Size screenSize(){
    return MediaQuery.of(this).size;
  }
  bool isSmall(){
    return MediaQuery.of(this).size.width < 800;
  }
  bool isMedium(){
    return MediaQuery.of(this).size.width >= 800 &&
        MediaQuery.of(this).size.width <= 1000;
  }
  bool isLarge(){
    return MediaQuery.of(this).size.width > 1000;
  }
}
