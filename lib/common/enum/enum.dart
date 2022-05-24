enum UserRole { guest, admin }

enum Water {
  frozen(0);

  final int tempCelsius;

  const Water(this.tempCelsius);

  external int get externalValue;
}
