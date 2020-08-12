class BookInfoModel {
  int code;
  String message;
  Data data;

  BookInfoModel({this.code, this.message, this.data});

  BookInfoModel.fromJson(Map<String, dynamic> json) {
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
  String image;
  bool have;
  String penName;
  String bookName;
  String bookDesc;
  bool update;
  String bookId;
  String chapterId;

  Data(
      {this.image,
      this.have,
      this.penName,
      this.bookName,
      this.bookDesc,
      this.bookId,
      this.update,
      this.chapterId});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    have = json['have'];
    penName = json['penName'];
    bookName = json['bookName'];
    bookDesc = json['bookDesc'];
    bookId = json['bookId'];
    update = json['update'];
    chapterId = json['chapterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['have'] = this.have;
    data['penName'] = this.penName;
    data['bookName'] = this.bookName;
    data['bookDesc'] = this.bookDesc;
    data['bookId'] = this.bookId;
    data['update'] = this.update;
    data['chapterId'] = this.chapterId;
    return data;
  }
}
