import 'package:slee_fi/resources/resources.dart';

enum UserRole { guest, admin }

enum BedType {
  short('Short', Ics.shortBed),
  middle('Middle', Ics.middleBed),
  long('Long', Ics.longBed),
  flexible('Flexible', Ics.flexibleBed);

  final String name;
  final String image;

  const BedType(this.name, this.image);
}

