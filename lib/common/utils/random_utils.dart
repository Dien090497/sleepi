import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:slee_fi/resources/resources.dart';

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

  String gachaItem() {
    List items = [Imgs.shortBed, Imgs.middleBed, Imgs.longBed, Imgs.flexibleBed,
      Imgs.jewelGreen, Imgs.jewelRed, Imgs.candyGreen, Imgs.candyPink, Ics.icSlft];

    final rnd = Random();
    int number = rnd.nextInt(items.length);
    return items.elementAt(number - 1);
  }
}
