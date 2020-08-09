/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-09 14:19:46
 * @LastEditTime: 2020-08-09 16:02:54
 */
class BookContentModel {
  int code;
  String message;
  Data data;

  BookContentModel({this.code, this.message, this.data});

  BookContentModel.fromJson(Map<String, dynamic> json) {
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
  dynamic nextId;
  String lastTitle;
  String nextTitle;
  int lastId;
  String title;
  dynamic content;

  Data(
      {this.nextId,
      this.lastTitle,
      this.nextTitle,
      this.lastId,
      this.title,
      this.content});

  Data.fromJson(Map<String, dynamic> json) {
    nextId = json['nextId'];
    lastTitle = json['lastTitle'];
    nextTitle = json['nextTitle'];
    lastId = json['lastId'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextId'] = this.nextId;
    data['lastTitle'] = this.lastTitle;
    data['nextTitle'] = this.nextTitle;
    data['lastId'] = this.lastId;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}
