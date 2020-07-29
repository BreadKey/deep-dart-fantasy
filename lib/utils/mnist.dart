import 'package:flutter/services.dart';

class Mnist {
  static const _firstOffset = 16;
  static const _dataSize = 28 * 28;

  final String _assetPath;
  static Map<String, List<List<num>>> _cache = {};

  Mnist._(this._assetPath);

  factory Mnist.training() => Mnist._("assets/mnist/train-images-idx3-ubyte");
  factory Mnist.test() => Mnist._("assets/mnist/t10k-images-idx3-ubyte");

  Future<List<List<num>>> load() async {
    if (_cache[_assetPath] == null) {
      final dataset = await rootBundle.load(_assetPath);

      final dataCount = (dataset.lengthInBytes - _firstOffset) ~/ _dataSize;

      _cache[_assetPath] = List.generate(
          dataCount,
          (dataIndex) => List.generate(
              _dataSize,
              (offset) => dataset
                  .getUint8(_firstOffset + (dataIndex * _dataSize) + offset)));
    }

    return _cache[_assetPath];
  }
}
