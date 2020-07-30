import 'package:flutter/foundation.dart';
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

      _cache[_assetPath] = await compute(_parseDataset, dataset);
    }

    return _cache[_assetPath];
  }

  static List<List<num>> _parseDataset(ByteData dataset) {
    final dataCount = (dataset.lengthInBytes - _firstOffset) ~/ _dataSize;
    return List.generate(
        dataCount,
        (dataIndex) => List.generate(
            _dataSize,
            (offset) => dataset
                .getUint8(_firstOffset + (dataIndex * _dataSize) + offset)));
  }
}
