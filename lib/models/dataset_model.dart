class DatasetModel {
  int? id;
  String? title;
  String? videoUrl;
  String? coverPicture;
  DatasetModel({this.id, this.title, this.videoUrl, this.coverPicture});

  DatasetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    videoUrl = json['videoUrl'];
    coverPicture = json['coverPicture'];
  }
}
