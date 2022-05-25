enum UserRole { guest, admin }

enum BedType {
  short('Short'),
  middle('Middle'),
  long('Long'),
  flexible('Flexible');

  final String name;

  const BedType(this.name);
}

