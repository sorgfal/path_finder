class MapPoint {
  final int x;
  final int y;

  MapPoint(this.x, this.y);

  @override
  bool operator ==(covariant MapPoint other) {
    if (identical(this, other)) return true;

    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => "$x:$y".hashCode;

  operator +(MapPoint p) => MapPoint(x + p.x, y + p.y);

  List<MapPoint> getNeigbors() {
    return <MapPoint>[
      this + MapPoint(-1, 1),
      this + MapPoint(0, 1),
      this + MapPoint(1, 1),
      this + MapPoint(-1, 0),
      this + MapPoint(1, 0),
      this + MapPoint(-1, -1),
      this + MapPoint(0, -1),
      this + MapPoint(1, -1),
    ];
  }

  @override
  String toString() => "MapPoint($x:$y)";
}
