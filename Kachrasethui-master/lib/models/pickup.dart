class PickupModel {
  late int id;
  late String? image;
  late String? category;
  late String? type;
  late String? userId;
  late String? status;
  late int? active;
  late String? address;
  late String? lat;
  late String? long;
  late String? message;
  late String createdAt;
  late String updatedAt;

  PickupModel(
      {id,
      image,
      category,
      type,
      userId,
      status,
      active,
      address,
      lat,
      long,
      message,
      createdAt,
      updatedAt});

  PickupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    type = json['type'];
    userId = json['user_id'];
    status = json['status'];
    active = json['active'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['category'] = this.category;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['active'] = this.active;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
