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
  bool isHave;
  String penName;
  String bookName;
  String bookDesc;
  bool isUpdate;
  dynamic bookId;
  dynamic chapterId;

  Data(
      {this.image,
      this.isHave,
      this.penName,
      this.bookName,
      this.bookDesc,
      this.bookId,
      this.isUpdate,
      this.chapterId});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isHave = json['isHave'];
    penName = json['penName'];
    bookName = json['bookName'];
    bookDesc = json['bookDesc'];
    bookId = json['bookId'];
    isUpdate = json['isUpdate'];
    chapterId = json['chapterId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['isHave'] = this.isHave;
    data['penName'] = this.penName;
    data['bookName'] = this.bookName;
    data['bookDesc'] = this.bookDesc;
    data['bookId'] = this.bookId;
    data['isUpdate'] = this.isUpdate;
    data['chapterId'] = this.chapterId;
    return data;
  }
}
