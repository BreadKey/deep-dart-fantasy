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
}

extension RowVector on List<num> {
  List<num> dot(List<List<num>> otherMatrix) => ([this] * otherMatrix).first;
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
}
