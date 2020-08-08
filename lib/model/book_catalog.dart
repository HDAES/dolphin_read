class BookCatalogModel {
  int code;
  String message;
  Data data;

  BookCatalogModel({this.code, this.message, this.data});

  BookCatalogModel.fromJson(Map<String, dynamic> json) {
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
  List<PpList> list;
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
      list = new List<PpList>();
      json['list'].forEach((v) {
        list.add(new PpList.fromJson(v));
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

class PpList {
  int id;
  int bookId;
  Null volumeId;
  int idx;
  String title;
  Null isFree;
  int price;
  Null addTime;
  Null updateTime;
  Null readView;
  Null chapterStatus;
  Null deleteTime;
  Null platform;
  Null platformId;
  Null isDisplay;

  PpList(
      {this.id,
      this.bookId,
      this.volumeId,
      this.idx,
      this.title,
      this.isFree,
      this.price,
      this.addTime,
      this.updateTime,
      this.readView,
      this.chapterStatus,
      this.deleteTime,
      this.platform,
      this.platformId,
      this.isDisplay});

  PpList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    volumeId = json['volumeId'];
    idx = json['idx'];
    title = json['title'];
    isFree = json['isFree'];
    price = json['price'];
    addTime = json['addTime'];
    updateTime = json['updateTime'];
    readView = json['readView'];
    chapterStatus = json['chapterStatus'];
    deleteTime = json['deleteTime'];
    platform = json['platform'];
    platformId = json['platformId'];
    isDisplay = json['isDisplay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookId'] = this.bookId;
    data['volumeId'] = this.volumeId;
    data['idx'] = this.idx;
    data['title'] = this.title;
    data['isFree'] = this.isFree;
    data['price'] = this.price;
    data['addTime'] = this.addTime;
    data['updateTime'] = this.updateTime;
    data['readView'] = this.readView;
    data['chapterStatus'] = this.chapterStatus;
    data['deleteTime'] = this.deleteTime;
    data['platform'] = this.platform;
    data['platformId'] = this.platformId;
    data['isDisplay'] = this.isDisplay;
    return data;
  }
}
