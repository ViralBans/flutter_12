class SimpleData {
  String getText([int? count]) {
    if(count == null) {
      return 'String from Data';
    } else {
      return 'String from Data with count = $count';
    }
  }
}