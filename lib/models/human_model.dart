class HumanModel {
  final int id;
  final String firstName;
  final String lastName;
  final String type;
  final String userId;
  final String streetArea;
  final String country;
  final String city;
  final String stateProvince;
  final String zipPostal;
  final String dateOfBirth;
  final String gender;
  final String height;
  final String complexion;
  final String? nationality;
  final String maritalStatus;
  final String condition;
  final String cnic;
  final String? cnicPicture;
  final String cnicIssueDate;
  final String cnicExpiryDate;
  final String dressColor;
  final String description;
  final String status;
  final String? referredBy;
  final String caseStatus;
  final String? claimerId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String age;
  final User user;
  final List<Picture> pictures;

  HumanModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.userId,
    required this.streetArea,
    required this.country,
    required this.city,
    required this.stateProvince,
    required this.zipPostal,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.complexion,
    this.nationality,
    required this.maritalStatus,
    required this.condition,
    required this.cnic,
    this.cnicPicture,
    required this.cnicIssueDate,
    required this.cnicExpiryDate,
    required this.dressColor,
    required this.description,
    required this.status,
    this.referredBy,
    required this.caseStatus,
    this.claimerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.age,
    required this.user,
    required this.pictures,
  });

  factory HumanModel.fromJson(Map<String, dynamic> json) {
    return HumanModel(
      id: json['id']??0,
      firstName: json['first_name'] ??"",
      lastName: json['last_name'] ?? "",
      type: json['type']??"",
      userId: "${json['user_id']??""}",
      streetArea: json['street_area']??"",
      country: json['country']??"",
      city: json['city']??"",
      stateProvince: json['state_province']??"",
      zipPostal: json['zip_postal']??"",
      dateOfBirth: json['date_of_birth']??"",
      gender: json['gender']??"",
      height: json['height']??"",
      complexion: json['complexion']??"",
      nationality: json['nationality']??"",
      maritalStatus: json['marital_status']??"",
      condition: json['condition']??"",
      cnic: json['cnic']??"",
      cnicPicture: json['cnic_picture']??"",
      cnicIssueDate: json['cnic_issue_date']??"",
      cnicExpiryDate: json['cnic_expiry_date']??"",
      dressColor: json['dress_color']??"",
      description: json['description']??"",
      status: json['status']??"",
      referredBy: json['referred_by']??"",
      caseStatus: json['case_status']??"",
      claimerId: json['claimer_id']??"",
      createdAt: json['created_at']??"",
      updatedAt: json['updated_at']??"",
      deletedAt: json['deleted_at']??"",
      age: "${json['age']??''}",
      user: User.fromJson(json['user']??{}),
      pictures: ((json['pictures'] ?? [])as List)
          .map((pictureJson) => Picture.fromJson(pictureJson))
          .toList(),
    );
  }
}

class User {
  final String id;
  final String name;
  final String image;
  final String phoneNum;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.phoneNum,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: "${json['id']??''}",
      name: json['name']??"",
      image: json['image']??"",
      phoneNum: json['phone_num']??"",
    );
  }
}

class Picture {
  final String id;
  final String humanId;
  final String picture;

  Picture({
    required this.id,
    required this.humanId,
    required this.picture,
  });

  // Factory constructor to create an instance of Picture from JSON
  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: "${json['id']??''}",
      humanId: "${json['human_id']??''}",
      picture: json['picture']??'',
    );
  }
}
