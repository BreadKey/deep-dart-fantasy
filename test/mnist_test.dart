import 'package:deep_dart_fantasy/utils/mnist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deep_dart_fantasy/utils/matrix.dart';

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
}
