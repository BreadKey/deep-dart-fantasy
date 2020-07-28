import 'package:deep_dart_fantasy/models/activation_functions.dart';
import 'package:deep_dart_fantasy/models/neural_network.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deep_dart_fantasy/utils.dart';

void main() {
  test("net test", () {
    final testNetwork = NeuralNetwork();
    final x = [1.0, 0.5];

    testNetwork.addLayer(
      Layer(w: [
        [0.1, 0.3, 0.5],
        [0.2, 0.4, 0.6]
      ], b: [
        0.1,
        0.2,
        0.3
      ], activationFunction: sigmoid),
    );

    final z1 = testNetwork.forward(x).map((e) => e.toFixed(8));
    expect(z1, [0.57444252, 0.66818777, 0.75026011]);

    testNetwork.addLayer(
      Layer(w: [
        [0.1, 0.4],
        [0.2, 0.5],
        [0.3, 0.6]
      ], b: [
        0.1,
        0.2
      ], activationFunction: sigmoid),
    );

    final z2 = testNetwork.forward(x);

    expect(z2.length, 2);

    testNetwork.addLayer(
      Layer(w: [
        [0.1, 0.3],
        [0.2, 0.4]
      ], b: [
        0.1,
        0.2
      ]),
    );

    final y = testNetwork.forward(x);

    print(y);
  });

  test("softmax test", () {
    final x = [0.3, 2.9, 4.0];

    final y = softmax(x);

    expect(y.sum, 1.0);
  });
}
