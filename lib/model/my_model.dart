class MyModel {
  String mydesc;
  String skillDesain;
  String skillDev;
  String skillDb;
  String myAds;
  List<ItemProject> projects;

  MyModel({
    required this.projects,
    required this.mydesc,
    required this.skillDesain,
    required this.skillDev,
    required this.skillDb,
    required this.myAds
  });

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
        mydesc: json["mydesc"],
        projects: List<ItemProject>.from(
          (json["projects"] as List).map((e) => ItemProject.fromJson(e)).where(
              (project) =>
              
                  project.judul != null &&
                  project.image != null &&
                  project.description != null &&
                  project.category != null &&
                  project.year != null),
        ),
        skillDesain: json["skilldesain"],
        skillDev: json["skilldev"],
        skillDb: json["skilldb"], myAds: json['myads'],
      );
}

class ItemProject {
  String? judul;
  String? image;
  String? description;
  String? category;
  int? year;
  List<Using> using;
  List<DetailImages> detailImages;

  ItemProject({
    required this.judul,
    required this.image,
    required this.description,
    required this.category,
    required this.year,
    required this.using,
    required this.detailImages,
  });

  factory ItemProject.fromJson(Map<String, dynamic> json) => ItemProject(
        judul: json["judul"],
        image: json["image"],
        description: json["description"],
        category: json["category"],
        year: json["year"],
        using: List<Using>.from(
          (json["using"] as List)
              .map((e) => Using.fromJson(e))
              .where((itemUse) => itemUse.tech != null),
        ),
        detailImages: List<DetailImages>.from((json["detailimages"] as List)
            .map((e) => DetailImages.fromJson(e))
            .where((itemImages) => itemImages.images != null)),
      );
}

class Using {
  String? tech;
  Using({required this.tech});

  factory Using.fromJson(Map<String, dynamic> json) => Using(
        tech: json["tech"],
      );
}

class DetailImages {
  String? images;
  DetailImages({required this.images});

  factory DetailImages.fromJson(Map<String, dynamic> json) => DetailImages(
        images: json["images"],
      );
}
