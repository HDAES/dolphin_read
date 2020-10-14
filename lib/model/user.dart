/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-14 09:26:36
 * @LastEditTime: 2020-10-14 14:24:06
 */
class UserModel {
  int code;
  String message;
  Data data;
  UserModel({this.code, this.message, this.data});
  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String authorization;
  String authorizationType;
  User user;
  Data({this.authorization, this.authorizationType, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    authorization = json['authorization'];
    authorizationType = json['authorizationType'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization'] = this.authorization;
    data['authorizationType'] = this.authorizationType;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String username;
  String nickname;
  Null sex;
  int isRegister;

  User({this.id, this.username, this.nickname, this.sex, this.isRegister});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nickname = json['nickname'];
    sex = json['sex'];
    isRegister = json['isRegister'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['nickname'] = this.nickname;
    data['sex'] = this.sex;
    data['isRegister'] = this.isRegister;
    return data;
  }
}
