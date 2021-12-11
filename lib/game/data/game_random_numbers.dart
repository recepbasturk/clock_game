import 'dart:math';

class GameRandomNumbers {
  final List<int> _hourHandList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
  ];

  final List<int> _minuteHandList = [
    5,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50,
    55,
    00,
  ];

  Map<int, int> randomNumbers() {
    final Random random = Random();
    final List<int> numList = [];
    final Map<int, int> resultMap = {};
    int i = 0;
    while (i < 4) {
      final int hourHand = _hourHandList[random.nextInt(12)];
      final int minuteHand = _minuteHandList[random.nextInt(12)];
      if (numList.contains(hourHand)) {
        continue;
      }
      numList.add(hourHand);
      resultMap[hourHand] = minuteHand;
      i++;
    }
    return resultMap;
  }
}
