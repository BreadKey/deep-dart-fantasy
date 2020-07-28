import 'dart:math';

num step(num x) => x > 0 ? 1 : 0;

num sigmoid(num x) => 1 / (1 + exp(-x));

num relu(num x) => x <= 0 ? 0 : x;