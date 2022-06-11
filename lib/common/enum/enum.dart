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

enum ItemType {
  short('Short', Imgs.candyBlue),
  middle('Middle', Imgs.candyGreen),
  long('Long', Imgs.candyPink),
  flexible('Flexible', Imgs.candyPurple);


  final String name;
  final String image;


  const ItemType(this.name, this.image);
}


