

class StoreRegion {
    List<Region> regions;
    List<Region> outerIslandRegions;
    StoreRegion({
        required this.regions,
        required this.outerIslandRegions
    });

    factory StoreRegion.fromJson(Map<String, dynamic> json) {

      List<Region> regions = List<Region>.from(json["regions"].map((x) => Region.fromJson(x)));
      List<Region> mainIsland = regions.where((element) => element.type == 0).toList();
      List<Region> outerIsland = regions.where((element) => element.type == 1).toList();
      mainIsland.insert(0, Region(id: 0, name: '全部', count: regions.fold(0, (previousValue, element) => previousValue + element.count), type: 0));
      outerIsland.insert(0, Region(id: 0, name: '全部', count: regions.fold(0, (previousValue, element) => previousValue + element.count), type: 0));
      
      return StoreRegion(regions: mainIsland, outerIslandRegions: outerIsland);
    }
    

    Map<String, dynamic> toJson() => {
        "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
    };
}

class Region {
    int id;
    String name;
    int count;
    int type;

    Region({
        required this.id,
        required this.name,
        required this.count,
        required this.type,
    });

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        count: json["count"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "count": count,
        "type": type,
    };
}