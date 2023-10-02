extension StringCapitalization on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension ListSmartJoin on List {
  String smartJoin() {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return first;
    }

    String s = '';
    for (int i = 0; i < length; i++) {
      if (i == length - 1) {
        s += '& ${this[i]}';
      } else if (i == length - 2) {
        s += '${this[i]} ';
      } else {
        s += '${this[i]}, ';
      }
    }

    return s;
  }
}
