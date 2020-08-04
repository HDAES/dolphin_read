class IndexBanner {
  int code;
  List<Data> data;
  String message;

  IndexBanner({this.code, this.data, this.message});

  IndexBanner.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  int bookId;
  int chapterId;
  String title;
  String subTitle;
  int type;
  String imgUrl;
  String thumb;
  String url;
  int sort;
  int isDisplay;
  String createTime;
  Null bookName;

  Data(
      {this.id,
      this.bookId,
      this.chapterId,
      this.title,
      this.subTitle,
      this.type,
      this.imgUrl,
      this.thumb,
      this.url,
      this.sort,
      this.isDisplay,
      this.createTime,
      this.bookName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    chapterId = json['chapterId'];
    title = json['title'];
    subTitle = json['subTitle'];
    type = json['type'];
    imgUrl = json['imgUrl'];
    thumb = json['thumb'];
    url = json['url'];
    sort = json['sort'];
    isDisplay = json['isDisplay'];
    createTime = json['createTime'];
    bookName = json['bookName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookId'] = this.bookId;
    data['chapterId'] = this.chapterId;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['type'] = this.type;
    data['imgUrl'] = this.imgUrl;
    data['thumb'] = this.thumb;
    data['url'] = this.url;
    data['sort'] = this.sort;
    data['isDisplay'] = this.isDisplay;
    data['createTime'] = this.createTime;
    data['bookName'] = this.bookName;
    return data;
  }
}
