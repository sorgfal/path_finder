import 'package:path_finder/map_model.dart';
import 'package:path_finder/map_point.dart';

class PathFinder {
  final MapModel map;
  final String forbiddenCellFlag;

  PathFinder(this.map, {this.forbiddenCellFlag = 'x'});
  List<MapPoint> findShortestPath(
      {required int startX,
      required int startY,
      required int endX,
      required int endY}) {
    _init(startX: startX, startY: startY);
    _weightCalc(MapPoint(endX, endY));
    var shortPath =
        _resolvePath(MapPoint(startX, startY), MapPoint(endX, endY));
    return shortPath.toList();
  }

  final Map<MapPoint, int> _weights = {};
  Map<MapPoint, int> get weightMap => _weights;

  void _init({required int startX, required int startY}) {
    _weights[MapPoint(startX, startY)] = 0;
  }

  void _weightCalc(MapPoint end) {
    int currentWeight = 1;
    bool isEndFounded = false;
    Set<MapPoint> previousNeighbors = {_weights.keys.first};
    while (!isEndFounded) {
      Set<MapPoint> newNeighbors = {};
      for (var n in previousNeighbors) {
        newNeighbors.addAll(n
            .getNeigbors()
            .where((pont) => pont.x >= 0 && pont.y >= 0)
            .where((point) => map[point]?.char != forbiddenCellFlag));
      }
      for (var nn in newNeighbors) {
        if (!_weights.containsKey(nn)) {
          _weights[nn] = currentWeight;
        }
        if (nn == end) {
          isEndFounded = true;
        }
      }
      previousNeighbors = newNeighbors;
      currentWeight++;
    }
    _weights[end] = currentWeight;
  }

  List<MapPoint> _resolvePath(MapPoint start, MapPoint end) {
    MapPoint current = end;
    List<MapPoint> shortPath = [];
    while (true) {
      shortPath.add(current);
      var currentNeighbors = current.getNeigbors();
      Map<MapPoint, int> currentNeighborsWeightsMap = {};
      for (var n in currentNeighbors) {
        if (_weights.containsKey(n)) {
          currentNeighborsWeightsMap[n] = _weights[n]!;
        }
      }
      var weightEntries = currentNeighborsWeightsMap.entries.toList();
      weightEntries.sort((a, b) => a.value.compareTo(b.value));
      current = weightEntries.first.key;

      if (current == start) {
        shortPath.add(current);
        return shortPath;
      }
    }
  }
}
