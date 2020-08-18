/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-18 16:18:26
 * @LastEditTime: 2020-08-18 16:40:34
 */
class FollowsModel {
  int code;
  String message;
  List<FollowData> data;

  FollowsModel({this.code, this.message, this.data});

  FollowsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<FollowData>();
      json['data'].forEach((v) {
        data.add(new FollowData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FollowData {
  int bookId;
  String bookName;
  String cateId;
  String image;
  String newChapterTitle;
  int isEnd;
  List<String> cateName;

  FollowData(
      {this.bookId,
      this.bookName,
      this.cateId,
      this.image,
      this.newChapterTitle,
      this.isEnd,
      this.cateName});

  FollowData.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    bookName = json['bookName'];
    cateId = json['cateId'];
    image = json['image'];
    isEnd = json['isEnd'];
    newChapterTitle = json['newChapterTitle'];
    cateName = json['cateName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookId'] = this.bookId;
    data['bookName'] = this.bookName;
    data['cateId'] = this.cateId;
    data['image'] = this.image;
    data['isEnd'] = this.isEnd;
    data['newChapterTitle'] = this.newChapterTitle;
    data['cateName'] = this.cateName;
    return data;
  }
}
