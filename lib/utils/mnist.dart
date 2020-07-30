import 'package:deep_dart_fantasy/models/labeled_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MnistData extends LabeledData<List<num>, int> {
  const MnistData(List<num> data, int label) : super(data, label);
}

class Mnist {
  static const _firstDataOffset = 16;
  static const _firstLabelOffset = 8;
  static const _dataSize = 28 * 28;

  final String _datasetPath;
  final String _labelsPath;
  static Map<String, List<MnistData>> _cache = {};

  Mnist._(this._datasetPath, this._labelsPath);

  factory Mnist.training() => Mnist._("assets/mnist/train-images-idx3-ubyte",
      "assets/mnist/train-labels.idx1-ubyte");
  factory Mnist.test() => Mnist._("assets/mnist/t10k-images-idx3-ubyte",
      "assets/mnist/t10k-labels.idx1-ubyte");

  Future<List<MnistData>> load() async {
    if (_cache[_datasetPath] == null) {
      final datasetByteData = await rootBundle.load(_datasetPath);
      final dataset = await compute(_parseDataset, datasetByteData);

      final labelsByteData = await rootBundle.load(_labelsPath);
      final labels = await compute(_parseLabels, labelsByteData);

      assert(dataset.length == labels.length);

      _cache[_datasetPath] = List.generate(
          dataset.length, (index) => MnistData(dataset[index], labels[index]));
    }

    return _cache[_datasetPath];
  }

  static List<List<num>> _parseDataset(ByteData datasetByteData) {
    final dataCount =
        (datasetByteData.lengthInBytes - _firstDataOffset) ~/ _dataSize;

    return List.generate(
        dataCount,
        (dataIndex) => List.generate(
            _dataSize,
            (offset) => datasetByteData.getUint8(
                _firstDataOffset + (dataIndex * _dataSize) + offset)));
  }

  static List<int> _parseLabels(ByteData labelsByteData) {
    final labelCount = (labelsByteData.lengthInBytes - _firstLabelOffset);

    return List.generate(labelCount,
        (labelIndex) => labelsByteData.getInt8(_firstLabelOffset + labelIndex));
  }
}
