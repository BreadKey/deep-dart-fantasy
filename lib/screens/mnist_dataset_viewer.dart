import 'package:deep_dart_fantasy/utils/mnist.dart';
import 'package:flutter/material.dart';

class MnistDatasetViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<List<MnistData>>(
      future: Mnist.test().load(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) => Row(
                      children: List.generate(3, (rowIndex) {
                        final labeledData = snapshot.data[index * 3 + rowIndex];

                        return Expanded(
                            child: FlatButton(
                          padding: EdgeInsets.all(16),
                          onPressed: () {
                            Navigator.of(context).pop(labeledData);
                          },
                          child: MnistImage(
                            labeledData.data,
                            key: ValueKey(labeledData),
                          ),
                        ));
                      }),
                    ))
            : Center(
                child: const CircularProgressIndicator(),
              );
      });
}

class MnistImage extends StatelessWidget {
  final List<num> _data;

  const MnistImage(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        key: ValueKey(_data),
        painter: _MnistImagePainter(_data),
      ));
}

class _MnistImagePainter extends CustomPainter {
  final List<num> _data;

  _MnistImagePainter(this._data);

  @override
  void paint(Canvas canvas, Size size) {
    final stride = size.width / 28;
    final space = stride / 2;

    final paint = Paint()..strokeWidth = stride + 1;

    for (int row = 0; row < 28; row++) {
      for (int column = 0; column < 28; column++) {
        final brightness = _data[row * 28 + column];
        paint.color = Colors.black.withAlpha(brightness);

        canvas.drawLine(Offset(space + column * stride, row * stride),
            Offset(space + column * stride, (row + 1) * stride + 1), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
