class UserModel {
  late User? user;
  late String token;

  UserModel({user, token});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  late int id;
  late String name;
  late String email;
  late String? emailVerifiedAt;
  late String? profilePhotoPath;
  late String? googleUid;
  late String? contact;
  late String? address;
  late String? lat;
  late String? long;
  late String? createdAt;
  late String? updatedAt;

  User(
      {id,
      name,
      email,
      emailVerifiedAt,
      profilePhotoPath,
      googleUid,
      contact,
      address,
      lat,
      long,
      createdAt,
      updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profilePhotoPath = json['profile_photo_path'];
    googleUid = json['google_uid'];
    contact = json['contact'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['google_uid'] = this.googleUid;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
