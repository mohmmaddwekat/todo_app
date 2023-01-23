class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  UserModel.fromJason(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    credit = json['credit'];
    image = json['image'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}
