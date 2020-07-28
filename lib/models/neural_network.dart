import 'package:deep_dart_fantasy/models/activation_functions.dart';
import 'package:deep_dart_fantasy/utils.dart';
import 'package:flutter/widgets.dart';

class NeuralNetwork {
  final _layers = <Layer>[];

  void addLayer(Layer layer) {
    if (_layers.isEmpty) {
      _layers.add(layer);
    } else {
      assert(_layers.last.w.column == layer.w.row);
      _layers.add(layer);
    }
  }

  List<num> forward(List<num> x) {
    assert(x.length == _layers.first.w.row);

    List<num> y = List.from(x);

    for (Layer layer in _layers) {
      y = y
          .dot(layer.w)
          .plus(layer.b)
          .map((e) => layer.activationFunction(e))
          .toList();
    }

    return y;
  }
}

class Layer {
  final List<List<num>> w;
  final List<num> b;
  final num Function(num) activationFunction;

  Layer(
      {@required this.w, @required this.b, this.activationFunction = identify})
      : assert(w != null && w.isNotEmpty),
        assert(b != null && b.isNotEmpty),
        assert(b.length == w.column);
}
