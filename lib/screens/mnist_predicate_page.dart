import 'package:deep_dart_fantasy/models/mnist_predicator.dart';
import 'package:deep_dart_fantasy/models/strings.dart';
import 'package:deep_dart_fantasy/screens/mnist_dataset_viewer.dart';
import 'package:flutter/material.dart';

class MnistPredicatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MnistPredicatePageState();
}

class _MnistPredicatePageState extends State<MnistPredicatePage> {
  final _predicator = MnistPredicator();
  List<num> _selectedData;
  int _predicateResult;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("MNIST"),
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSelectMnistButton(context),
                  RaisedButton(
                    onPressed: _selectedData == null || _predicateResult != null
                        ? null
                        : () {
                            setState(() {
                              _predicateResult =
                                  _predicator.predicate(_selectedData);
                            });
                          },
                    child:
                        Text(_predicateResult?.toString() ?? Strings.predicate),
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget _buildSelectMnistButton(BuildContext context) => Container(
        width: 150,
        height: 150,
        child: FlatButton(
          onPressed: () async {
            final selectedData = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(Strings.selectMnist),
                content: AspectRatio(
                  aspectRatio: 1.618,
                  child: MnistDatasetViewer(),
                ),
              ),
            );

            if (selectedData != null) {
              setState(() {
                _selectedData = selectedData;
                _predicateResult = null;
              });
            }
          },
          child: _selectedData == null
              ? Text(Strings.selectMnist)
              : MnistImage(_selectedData),
        ),
      );
}
