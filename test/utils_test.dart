import 'package:deep_dart_fantasy/models/activation_functions.dart';
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

  test("neural network test", () {
    final x = [1.0, 0.5];
    final w1 = [
      [0.1, 0.3, 0.5],
      [0.2, 0.4, 0.6]
    ];
    final b1 = [0.1, 0.2, 0.3];

    final a1 = x.dot(w1).plus(b1);

    final z1 = a1.map((e) => sigmoid(e)).toList();

    expect(z1.map((e) => e.toFixed(8)), [0.57444252, 0.66818777, 0.75026011]);

    final w2 = [
      [0.1, 0.4],
      [0.2, 0.5],
      [0.3, 0.6]
    ];

    final b2 = [0.1, 0.2];

    final a2 = z1.dot(w2).plus(b2);
    final z2 = a2.map((e) => sigmoid(e)).toList();

    final w3 = [
      [0.1, 0.1],
      [0.2, 0.4]
    ];

    final b3 = [0.1, 0.2];

    final a3 = z2.dot(w3).plus(b3);
    final y = a3.map((e) => e).toList();

    print(y);
  });
}
