class ShopLoginModel {
  String? token;
  String? messageSuccess;
  List<DataError>? errors = [];

  ShopLoginModel();

  ShopLoginModel.fromjson(Map<String, dynamic>? json) {
    if (json != null) {
      token = json['token'];
      messageSuccess = json['message'];
      if (json['errors'] != null) {
        json['errors'].forEach((element) {
          errors!.add(DataError.fromjson(element));
        });
      }
    }
  }
}

class DataError {
  String? value;
  String? message;
  String? par;
  String? location;
  DataError.fromjson(Map<String, dynamic>? json) {
    if (json != null) {
      value = json['value'];
      message = json['msg'];
      par = json['param'];
      location = json['location'];
    }
  }
}

/*
class userData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  userData.fromjson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'];
      name = json['name'];
      email = json['email'];
      phone = json['phone'];
      image = json['image'];
      points = json['points'];
      credit = json['credit'];
      token = json['token'];
    }
  }
}
*/