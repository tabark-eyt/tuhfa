class AboutModel {
  int? id;
  String? image;
  String? description;
  String? created;
  String? updated;

  AboutModel(
      {this.id, this.image, this.description, this.created, this.updated});

  AboutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}