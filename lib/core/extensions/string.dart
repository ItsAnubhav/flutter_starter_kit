extension StringExtensions on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
