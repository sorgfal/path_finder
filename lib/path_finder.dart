import 'package:path_finder/map_cell.dart';
import 'package:path_finder/map_model.dart';

class PathFinder {
  final MapModel map;

  PathFinder(this.map);
  List<MapCell> findShortestPath(
      {required int startX, int startY, int endX, int endY}) {}
}
