import 'package:deep_dart_fantasy/models/mnist_predicator.dart';
import 'package:deep_dart_fantasy/utils/mnist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(TestWidgetsFlutterBinding.ensureInitialized);
  test("load training dataset test", () async {
    final dataset = await Mnist.training().load();

    expect(dataset.length, 60000);
  });

  test("load test dataset test", () async {
    final dataset = await Mnist.test().load();

    expect(dataset.length, 10000);
  });

  test("mnist predicate test", () async {
    final predicator = MnistPredicator();

    final dataset = await Mnist.training().load();

    expect(predicator.predicate(dataset.first.data), dataset.first.label);
  });
}
