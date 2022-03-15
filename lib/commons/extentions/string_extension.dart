extension ModuleStringExtension on String {
  String get enumToName {
    final List<String> paths = this.split('.');
    return paths[1];
  }
}