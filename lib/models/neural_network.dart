import 'dart:math';

import 'package:deep_dart_fantasy/models/activation_functions.dart';
import 'package:deep_dart_fantasy/utils/matrix.dart';
import 'package:flutter/widgets.dart';

typedef List<num> Output(List<num> x);
List<num> identify(List<num> x) => x;
List<num> softmax(List<num> x) {
  final max = x.max;

  /// Prevent overflow error
  final expX = x.map((e) => exp(e - max)).toList();
  final sumOfExpX = expX.sum;

  return expX.map((e) => e / sumOfExpX).toList();
}

class NeuralNetwork {
  final _layers = <Layer>[];
  Output output;

  NeuralNetwork({this.output = identify});

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
          .map((e) => layer.activationFunction?.call(e) ?? e)
          .toList();
    }

    return output(y);
  }
}

class Layer {
  final List<List<num>> w;
  final List<num> b;
  final ActivationFunction activationFunction;

  Layer({@required this.w, @required this.b, this.activationFunction})
      : assert(w != null && w.isNotEmpty),
        assert(b != null && b.isNotEmpty),
        assert(b.length == w.column);
}
