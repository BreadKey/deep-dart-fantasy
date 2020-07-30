import 'package:deep_dart_fantasy/models/mnist_predicator.dart';
import 'package:deep_dart_fantasy/utils/matrix.dart';
import 'package:deep_dart_fantasy/utils/mnist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(TestWidgetsFlutterBinding.ensureInitialized);
  test("load training dataset test", () async {
    final dataset = await Mnist.training().load();

    expect(dataset.row, 60000);
  });

  test("load test dataset test", () async {
    final dataset = await Mnist.test().load();

    expect(dataset.row, 10000);
  });

  test("mnist predicate test", () async {
    final predicator = MnistPredicator();

    final dataset = await Mnist.training().load();

    expect(predicator.predicate(dataset[0]), 5);
  });
}
