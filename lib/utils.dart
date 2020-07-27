extension NumListOperation on List<num> {
  num get sum => reduce((value, element) => value + element);

  List<num> operator *(List<num> other) =>
      List.generate(length, (index) => this[index] * other[index]);
}

extension RowVector on List<num> {
  List<num> dot(List<List<num>> otherMatrix) => ([this] * otherMatrix).first;
}

extension Matrix on List<List<num>> {
  int get row => length;
  int get column => first.length;

  List<List<num>> operator *(List<List<num>> other) =>
      map((rowVector) => List.generate(
          other.column,
          (columnIndex) =>
              (rowVector * other.columnVectorAt(columnIndex)).sum)).toList();

  List<num> columnVectorAt(int index) =>
      List.generate(row, (rowIndex) => this[rowIndex][index]);
}
