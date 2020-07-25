num and(num x1, num x2) {
  final x = [x1, x2];
  final w = [0.5, 0.5];
  final b = -0.7;

  return _calculateResult(x, w, b);
}

num nand(num x1, num x2) {
  final x = [x1, x2];
  final w = [-0.5, -0.5];
  final b = 0.7;

  return _calculateResult(x, w, b);
}

num _calculateResult(List<num> x, List<num> w, num b) =>
    (x * w).sum + b <= 0 ? 0 : 1;

extension NumListOperation on List<num> {
  num get sum => reduce((value, element) => value + element);

  List<num> operator *(List<num> other) =>
      List.generate(length, (index) => this[index] * other[index]);
}
