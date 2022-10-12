import 'package:path_finder/map_cell.dart';
import 'package:path_finder/map_point.dart';

class MapModel {
  final int width;
  final List<MapCell> cells;
  late Map<MapPoint, MapCell> _indexedCells;
  MapModel(this.cells, this.width) {
    buildIndexCells();
  }

  void buildIndexCells() {
    _indexedCells = Map.fromEntries(
      [for (var c in cells) MapEntry(c.point, c)],
    );
  }

  MapCell? operator [](MapPoint x) => _indexedCells[x];
}
