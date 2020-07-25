import 'package:charts_flutter/flutter.dart';
import 'package:deep_dart_fantasy/models/activation_functions.dart';
import 'package:flutter/material.dart';

class ActivationFunctionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activation Functions"),
      ),
      body: Row(
        children: [
          Expanded(
            child: _buildActivationFunctionGraph(context, "Step", step),
          ),
          const VerticalDivider(),
          Expanded(
            child: _buildActivationFunctionGraph(context, "Sigmoid", sigmoid),
          ),
          const VerticalDivider(),
          Expanded(
            child: _buildActivationFunctionGraph(context, "ReLU", relu),
          )
        ],
      ),
    );
  }

  Widget _buildActivationFunctionGraph(
    BuildContext context,
    String name,
    num Function(num x) function,
  ) =>
      LineChart(
        <Series<num, num>>[
          Series<num, num>(
            id: name,
            data: [for (num i = -6; i < 6; i += 0.1) i],
            domainFn: (x, _) => x,
            measureFn: (x, _) => function(x),
          )
        ],
        behaviors: [
          ChartTitle("$name Function", behaviorPosition: BehaviorPosition.top)
        ],
      );
}
