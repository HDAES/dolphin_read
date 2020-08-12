class UserHistoryModel {
  int code;
  String message;
  Data data;

  UserHistoryModel({this.code, this.message, this.data});

  UserHistoryModel.fromJson(Map<String, dynamic> json) {
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
  int total;
  List<HistoryData> list;
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int pages;
  int prePage;
  int nextPage;
  bool isFirstPage;
  bool isLastPage;
  bool hasPreviousPage;
  bool hasNextPage;
  int navigatePages;
  List<int> navigatepageNums;
  int navigateFirstPage;
  int navigateLastPage;

  Data(
      {this.total,
      this.list,
      this.pageNum,
      this.pageSize,
      this.size,
      this.startRow,
      this.endRow,
      this.pages,
      this.prePage,
      this.nextPage,
      this.isFirstPage,
      this.isLastPage,
      this.hasPreviousPage,
      this.hasNextPage,
      this.navigatePages,
      this.navigatepageNums,
      this.navigateFirstPage,
      this.navigateLastPage});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = new List<HistoryData>();
      json['list'].forEach((v) {
        list.add(new HistoryData.fromJson(v));
      });
    }
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    pages = json['pages'];
    prePage = json['prePage'];
    nextPage = json['nextPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    navigatePages = json['navigatePages'];
    navigatepageNums = json['navigatepageNums'].cast<int>();
    navigateFirstPage = json['navigateFirstPage'];
    navigateLastPage = json['navigateLastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['pageNum'] = this.pageNum;
    data['pageSize'] = this.pageSize;
    data['size'] = this.size;
    data['startRow'] = this.startRow;
    data['endRow'] = this.endRow;
    data['pages'] = this.pages;
    data['prePage'] = this.prePage;
    data['nextPage'] = this.nextPage;
    data['isFirstPage'] = this.isFirstPage;
    data['isLastPage'] = this.isLastPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['navigatePages'] = this.navigatePages;
    data['navigatepageNums'] = this.navigatepageNums;
    data['navigateFirstPage'] = this.navigateFirstPage;
    data['navigateLastPage'] = this.navigateLastPage;
    return data;
  }
}

class HistoryData {
  int userId;
  int bookId;
  String updateTime;
  int chapterId;
  String bookName;
  String cateId;
  String title;
  String image;
  String updateTitle;
  List<String> cateName;

  HistoryData(
      {this.userId,
      this.bookId,
      this.updateTime,
      this.chapterId,
      this.bookName,
      this.cateId,
      this.title,
      this.image,
      this.updateTitle,
      this.cateName});

  HistoryData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    bookId = json['bookId'];
    updateTime = json['updateTime'];
    chapterId = json['chapterId'];
    bookName = json['bookName'];
    cateId = json['cateId'];
    title = json['title'];
    image = json['image'];
    updateTitle = json['updateTitle'];
    cateName = json['cateName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['bookId'] = this.bookId;
    data['updateTime'] = this.updateTime;
    data['chapterId'] = this.chapterId;
    data['bookName'] = this.bookName;
    data['cateId'] = this.cateId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['updateTitle'] = this.updateTitle;
    data['cateName'] = this.cateName;
    return data;
  }
}
