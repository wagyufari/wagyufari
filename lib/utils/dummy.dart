import 'dart:ui';
import 'package:equatable/equatable.dart';

class Dummy {
  static List<Architecture> architectures = [
    Architecture("Rumah 2 Tingkat", Size(10, 20), "Pontianak, Kalimantan Barat", "building1.png"),
    Architecture("Villa", Size(4.5, 15), "Purwakarta, Jawa Barat", "building2.png"),
  ];
}

class Architecture extends Equatable {
  final String name;
  final Size size;
  final String location;
  final String imageName;

  Architecture(this.name, this.size, this.location, this.imageName);

  @override
  List<Object?> get props => [name, size, location, imageName];
}
