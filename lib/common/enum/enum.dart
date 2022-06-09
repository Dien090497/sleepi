import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short('Short', Imgs.bed180, false),
  middle('Middle', Ics.middleBed, false),
  flexible('Flexible', Ics.flexibleBed, false),
  long('Long', Ics.longBed, false);

  final String name;
  final String image;
  final bool selected;


  const BedType(this.name, this.image, this.selected);
}

