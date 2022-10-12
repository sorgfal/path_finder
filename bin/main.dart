import 'package:path_finder/map_cell.dart';
import 'package:path_finder/map_loader.dart';
import 'package:path_finder/map_model.dart';

import 'package:path_finder/map_printer.dart';
import 'package:path_finder/path_finder.dart';

void main(List<String> arguments) {
  String mapString = "...x.."
      "...x.."
      "...x.."
      "......";
  var map = MapLoader(mapString, 6).buildMap();
  var pathFinder = PathFinder(map);
  var shortPath =
      pathFinder.findShortestPath(startX: 0, startY: 0, endX: 5, endY: 0);
  var mapPrinter = MapPrinter();
  mapPrinter.addMapLayer(map);
  mapPrinter.addMapLayer(
    MapModel(
        pathFinder.weightMap.entries
            .map((e) => MapCell(
                  e.key.x,
                  e.key.y,
                  e.value.toString(),
                ))
            .toList(),
        6),
  );
  mapPrinter.addMapLayer(MapModel(
      shortPath
          .map((e) => MapCell(
                e.x,
                e.y,
                '*',
              ))
          .toList(),
      6));
  print(mapPrinter.buildString(6, 6));
}
