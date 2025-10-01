

class ShopcartListProject {

  List<ShopcartProject> available;
  List<ShopcartProject> unAvalible;

  ShopcartListProject({required this.available, required this.unAvalible});

  factory ShopcartListProject.fromJson(Map<String, dynamic> json) {

    return ShopcartListProject(
      available: List<ShopcartProject>.from(json['available'].map((x) => ShopcartProject.fromJson(x))), 
      unAvalible: List<ShopcartProject>.from(json['unavailable'].map((x) => ShopcartProject.fromJson(x)))
    );
  }
}


class ShopcartProject {
  int id;
  String name;

  ShopcartProject({required this.id, required this.name});

  factory ShopcartProject.fromJson(Map<String, dynamic> json) {

    return ShopcartProject(
      id: json['id'], 
      name: json['name']
    );
  }
}


