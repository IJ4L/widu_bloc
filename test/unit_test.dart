import 'package:flutter_test/flutter_test.dart';

class Counter {
  int number = 0;

  void increment() => number++;
  void decrement() => number--;
}

void main() {
  group('Counter', () {
    test('Increment Counter test', () {
      final counter = Counter();

      counter.increment();

      expect(counter.number, 1);
    });

    test('Decrement Counter test', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.number, -1);
    });
  });
}
