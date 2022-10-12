import 'package:path_finder/map_point.dart';

class MapCell {
  final MapPoint point;
  final String char;

  MapCell(x, y, this.char) : point = MapPoint(x, y);

  @override
  String toString() => char;
}
