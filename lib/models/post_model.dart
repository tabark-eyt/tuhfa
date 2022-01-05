class PostModel {
  String? title;
  String? description;
  String? image;
  String? createdOn;
  String? updatedOn;

  PostModel(
      {this.title,
        this.description,
        this.image,
        this.createdOn,
        this.updatedOn});

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    return data;
  }
}