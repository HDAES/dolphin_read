class SearchMode {
  int code;
  String message;
  List<Data> data;

  SearchMode({this.code, this.message, this.data});

  SearchMode.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  String newChapterTitle;
  String panName;
  String bookUrl;
  String platformName;
  int type;
  String bookName;
  int isEnd;
  String bookId;
  String bookImage;

  Data(
      {this.newChapterTitle,
      this.panName,
      this.bookUrl,
      this.platformName,
      this.type,
      this.bookName,
      this.isEnd,
      this.bookId,
      this.bookImage});

  Data.fromJson(Map<String, dynamic> json) {
    newChapterTitle = json['newChapterTitle'];
    panName = json['panName'];
    bookUrl = json['bookUrl'];
    platformName = json['platformName'];
    type = json['type'];
    bookName = json['bookName'];
    isEnd = json['isEnd'];
    bookId = json['bookId'];
    bookImage = json['bookImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newChapterTitle'] = this.newChapterTitle;
    data['panName'] = this.panName;
    data['bookUrl'] = this.bookUrl;
    data['platformName'] = this.platformName;
    data['type'] = this.type;
    data['bookName'] = this.bookName;
    data['isEnd'] = this.isEnd;
    data['bookId'] = this.bookId;
    data['bookImage'] = this.bookImage;
    return data;
  }
}
