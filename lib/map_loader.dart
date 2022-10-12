import 'package:path_finder/map_cell.dart';
import 'package:path_finder/map_model.dart';

class MapLoader {
  final String mapString;
  final int width;

  MapLoader(
    this.mapString,
    this.width,
  );

  MapModel buildMap() {
    var height = (mapString.length / width).toInt();
    int x = 0;
    List<MapCell> cells = [];
    for (var i = 0; i < mapString.length; i++) {
      cells.add(MapCell(i ~/ width, i % width, mapString[i]));
    }
    var mapModel = MapModel(cells);
    mapModel.indexCells();
    return mapModel;
  }
}
