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
        body: OrientationBuilder(builder: (context, orientation) {
          final divider = orientation == Orientation.landscape
              ? const VerticalDivider()
              : Divider();

          final children = [
            Expanded(
              child: _buildActivationFunctionGraph(context, "Step", step),
            ),
            divider,
            Expanded(
              child: _buildActivationFunctionGraph(context, "Sigmoid", sigmoid),
            ),
            divider,
            Expanded(
              child: _buildActivationFunctionGraph(context, "ReLU", reLu),
            )
          ];

          return orientation == Orientation.landscape
              ? Row(children: children)
              : Column(children: children);
        }));
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
