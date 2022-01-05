class CalenderModel {
  int? id;
  String? day;
  Category? category;
  String? startTime;
  String? endTime;
  String? created;
  String? updated;

  CalenderModel(
      {this.id,
        this.day,
        this.category,
        this.startTime,
        this.endTime,
        this.created,
        this.updated});

  CalenderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    startTime = json['start_time'];
    endTime = json['end_time'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}