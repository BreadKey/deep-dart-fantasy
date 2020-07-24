import 'package:deep_dart_fantasy/models/perceptron.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("and test", () {
    expect(and(0, 0), 0);
    expect(and(0, 1), 0);
    expect(and(1, 0), 0);
    expect(and(1, 1), 1);
  });
}
