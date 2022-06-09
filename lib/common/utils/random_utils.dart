import 'dart:math';

import 'package:injectable/injectable.dart';

// ignore_for_file: non_constant_identifier_names
@Injectable()
class RandomUtils {
  String randomId() {
    int min = 65, max = 90;
    var rnd = Random();
    var number = rnd.nextDouble() * 10000;
    while (number < 1000) {
      number *= 10;
    }
    int r = min + rnd.nextInt(max - min);
    String alphabet = String.fromCharCodes(List.generate(1, (index) => r));
    String id = '$alphabet${number.toInt()}';
    return id;
  }
}
