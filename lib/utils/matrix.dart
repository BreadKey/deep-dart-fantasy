extension NumUtls on num {
  num toFixed(int fractionDigits) => num.parse(toStringAsFixed(fractionDigits));
}

/// reduce function cause ERROR: type '(num, num) => num' is not a subtype of type '(double, double) => double' of 'combine'
extension NumListOperation on List<num> {
  num get sum => fold(0, (previousValue, element) => previousValue + element);

  List<num> operator *(List<num> other) =>
      List.generate(length, (index) => this[index] * other[index]);

  List<num> plus(List<num> other) =>
      List.generate(length, (index) => this[index] + other[index]);

  num get max => fold(
      first,
      (previousValue, element) =>
          element > previousValue ? element : previousValue);

  num get indexOfMax {
    int indexOfMax = 0;

    for (int index = 1; index < length; index++) {
      indexOfMax = this[indexOfMax] > this[index] ? indexOfMax : index;
    }

    return indexOfMax;
  }
}

extension RowVector on List<num> {
  List<num> dot(List<List<num>> otherMatrix) => ([this] * otherMatrix).first;

  List<List<num>> reshape(int row, int column) {
    assert(row * column == length);

    return List.generate(row, (rowIndex) {
      final start = rowIndex * column;
      return sublist(start, start + column);
    });
  }
}

extension Matrix on List<List<num>> {
  int get row => length;
  int get column => first.length;

  List<List<num>> operator *(List<List<num>> other) {
    assert(column == other.row);
    return map((rowVector) => List.generate(
        other.column,
        (columnIndex) =>
            (rowVector * other.columnVectorAt(columnIndex)).sum)).toList();
  }

  List<num> columnVectorAt(int index) =>
      List.generate(row, (rowIndex) => this[rowIndex][index]);

  List<num> flatten() =>
      fold(<num>[], (previousValue, element) => previousValue + element);

  List<List<num>> reshape(int row, int column) =>
      flatten().reshape(row, column);
}
