class MapCell {
  final int x;
  final int y;
  final String char;

  MapCell(this.x, this.y, this.char);

  String get coordKey => "$x:$y";
  @override
  String toString() => char;
}
