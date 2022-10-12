import 'package:path_finder/map_model.dart';

class MapPrinter {
  final List<MapModel> _maps = [];

  MapPrinter();

  void addMapLayer(MapModel mapModel) {
    _maps.add(mapModel);
  }

  String buildString(int sizeX, int sizeY) {
    List<List<String>> result =
        List.generate(sizeY, (index) => List.generate(sizeX, (index) => ' '));

    for (var m in _maps) {
      for (var c in m.cells) {
        if (result.length > c.point.y && result[c.point.y].length > c.point.x) {
          result[c.point.y][c.point.x] = c.char;
        }
      }
    }
    return result.map((e) => e.join('')).join('\n');
  }
}
