class SimpleData {
  String getText() {
    Future.delayed(const Duration(seconds: 3));
    return 'String from Data';
  }
}