import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short('Short', Imgs.shortBed),
  middle('Middle', Imgs.middleBed),
  long('Long', Imgs.longBed),
  flexible('Flexible', Imgs.flexibleBed);


  final String name;
  final String image;


  const BedType(this.name, this.image);
}

