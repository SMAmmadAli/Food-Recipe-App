class ApiModels {
  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;

  ApiModels({this.results, this.offset, this.number, this.totalResults});

  factory ApiModels.fromJson(Map<String, dynamic> json) {
    return ApiModels(
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Results.fromJson(i)).toList()
          : null,
      offset: json['offset'],
      number: json['number'],
      totalResults: json['totalResults'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results?.map((v) => v.toJson()).toList(),
      'offset': offset,
      'number': number,
      'totalResults': totalResults,
    };
  }
}

class Results {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Results({this.id, this.title, this.image, this.imageType});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'imageType': imageType,
    };
  }
}
