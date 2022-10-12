import 'package:path_finder/map_cell.dart';

class MapModel {
  final List<MapCell> cells;
  late Map<String, MapCell> _indexedCells;
  MapModel(this.cells);

  void indexCells() {
    for (var c in cells) {
      _indexedCells[c.coordKey] = c;
    }
  }

  _MapModelIndexHelper operator [](x) => _MapModelIndexHelper(x, _indexedCells);
}

class _MapModelIndexHelper {
  final int x;
  final Map<String, MapCell> cells;

  _MapModelIndexHelper(this.x, this.cells);
  MapCell? operator [](y) => cells["$x:$y"];
}
