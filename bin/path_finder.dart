import 'package:path_finder/map_loader.dart';
import 'package:path_finder/map_model.dart';

void main(List<String> arguments) {
  String mapString = "...x.."
      "...x.."
      "...x.."
      "......";
  var map = MapLoader(mapString, 6).buildMap();
  print(map[0][0]);
}
