import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short('Short', Imgs.bed360),
  middle('Middle', Ics.middleBed),
  flexible('Flexible', Ics.flexibleBed),
  long('Long', Ics.longBed);

  final String name;
  final String image;


  const BedType(this.name, this.image);
}

