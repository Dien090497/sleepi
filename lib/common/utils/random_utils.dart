import 'dart:math';

import 'package:injectable/injectable.dart';

@Injectable()
class RandomUtils {
  String randomId() {
    int min = 65, max = 90;
    final rnd = Random();
    double number = rnd.nextDouble() * 100000;
    while (number < 10000) {
      number *= 10;
    }
    int r = min + rnd.nextInt(max - min);
    String alphabet = String.fromCharCodes(List.generate(1, (index) => r));
    String id = '$alphabet${number.toInt()}';
    return id;
  }

  String randomOTPCode() {
    final rnd = Random();
    final l = List.generate(6, (_) => rnd.nextInt(10));
    return l.join('');
  }
}
