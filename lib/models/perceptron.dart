num and(num x1, num x2) {
  final w1 = 0.5;
  final w2 = 0.5;
  final theta = 0.7;

  final tmp = x1 * w1 + x2 * w2;

  return tmp <= theta ? 0 : 1;
}
