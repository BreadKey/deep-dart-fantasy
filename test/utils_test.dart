import 'package:flutter_test/flutter_test.dart';
import 'package:deep_dart_fantasy/utils.dart';

void main() {
  test("column vector test", () {
    final matrix = [
      [1, 2],
      [3, 4]
    ];

    expect(matrix.columnVectorAt(0), [1, 3]);
    expect(matrix.columnVectorAt(1), [2, 4]);
  });
  test("2x2 materix * 2x2 materix test", () {
    final a = [
      [1, 2],
      [3, 4]
    ];

    final b = [
      [5, 6],
      [7, 8]
    ];

    expect(a * b, [
      [19, 22],
      [43, 50]
    ]);
  });

  test("2x3 materix * 3x2 materix test", () {
    final a = [
      [1, 2, 3],
      [4, 5, 6]
    ];

    final b = [
      [1, 2],
      [3, 4],
      [5, 6]
    ];

    expect(a * b, [
      [22, 28],
      [49, 64]
    ]);
  });

  test("1x2 matrix * 2x3 matrix", () {
    final a = [1, 2];
    final b = [
      [1, 3, 5],
      [2, 4, 6]
    ];

    expect(a.dot(b), [5, 11, 17]);
  });
}
