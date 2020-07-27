import 'package:deep_dart_fantasy/utils.dart';

num and(num x1, num x2) {
  final x = [x1, x2];
  final w = [0.5, 0.5];
  final b = -0.7;

  return _calculateResult(x, w, b);
}

num or(num x1, num x2) {
  final x = [x1, x2];
  final w = [0.5, 0.5];
  final b = -0.3;

  return _calculateResult(x, w, b);
}

num nand(num x1, num x2) {
  final x = [x1, x2];
  final w = [-0.5, -0.5];
  final b = 0.7;

  return _calculateResult(x, w, b);
}

num xor(num x1, x2) => and(nand(x1, x2), or(x1, x2));

num _calculateResult(List<num> x, List<num> w, num b) =>
    (x * w).sum + b <= 0 ? 0 : 1;