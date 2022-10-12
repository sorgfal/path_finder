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
    return MapModel([
      for (var i = 0; i < mapString.length; i++)
        MapCell(i % width, i ~/ width, mapString[i])
    ], width);
  }
}
