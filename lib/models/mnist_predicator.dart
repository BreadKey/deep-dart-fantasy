import 'package:deep_dart_fantasy/models/activation_functions.dart';
import 'package:deep_dart_fantasy/models/mnist_sample_weight.dart';
import 'package:deep_dart_fantasy/models/neural_network.dart';
import 'package:deep_dart_fantasy/utils/matrix.dart';
import 'package:flutter/foundation.dart';

class MnistPredicator extends NeuralNetwork {
  static MnistPredicator _instance = MnistPredicator._();

  MnistPredicator._() {
    addLayer(Layer(
        w: _castWeight(sampleWeight['W1']),
        b: sampleWeight['b1'].cast<num>(),
        activationFunction: sigmoid));

    addLayer(Layer(
        w: _castWeight(sampleWeight['W2']),
        b: sampleWeight['b2'].cast<num>(),
        activationFunction: sigmoid));

    addLayer(Layer(
        w: _castWeight(sampleWeight['W3']), b: sampleWeight['b3'].cast<num>()));

    output = softmax;
  }

  factory MnistPredicator() => _instance;

  List<List<num>> _castWeight(List<dynamic> weight) =>
      weight.map((dynamic list) => list.cast<num>()).cast<List<num>>().toList();

  int predicate(List<num> mnistData) => forward(mnistData).indexOfMax;
}
