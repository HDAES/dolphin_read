class IndexModel {
  int code;
  String message;
  Data data;

  IndexModel({this.code, this.message, this.data});

  IndexModel.fromJson(Map<String, dynamic> json) {
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
  List<IndexList> list;
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
      list = new List<IndexList>();
      json['list'].forEach((v) {
        list.add(new IndexList.fromJson(v));
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

class IndexList {
  String bookName;
  String penName;
  String bookDesc;
  String image;
  bool have;
  String bookId;
  bool update;
  int isEnd;
  Null chapterId;
  String cateId;
  String girlImage;
  String newChapterTitle;
  int type;
  List<String> cateName;

  IndexList(
      {this.bookName,
      this.penName,
      this.bookDesc,
      this.image,
      this.have,
      this.bookId,
      this.update,
      this.isEnd,
      this.chapterId,
      this.cateId,
      this.girlImage,
      this.newChapterTitle,
      this.type,
      this.cateName});

  IndexList.fromJson(Map<String, dynamic> json) {
    bookName = json['bookName'];
    penName = json['penName'];
    bookDesc = json['bookDesc'];
    image = json['image'];
    have = json['have'];
    bookId = json['bookId'];
    update = json['update'];
    isEnd = json['isEnd'];
    chapterId = json['chapterId'];
    cateId = json['cateId'];
    girlImage = json['girlImage'];
    newChapterTitle = json['newChapterTitle'];
    type = json['type'];
    cateName = json['cateName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookName'] = this.bookName;
    data['penName'] = this.penName;
    data['bookDesc'] = this.bookDesc;
    data['image'] = this.image;
    data['have'] = this.have;
    data['bookId'] = this.bookId;
    data['update'] = this.update;
    data['isEnd'] = this.isEnd;
    data['chapterId'] = this.chapterId;
    data['cateId'] = this.cateId;
    data['girlImage'] = this.girlImage;
    data['type'] = this.type;
    data['newChapterTitle'] = this.newChapterTitle;
    data['cateName'] = this.cateName;
    return data;
  }
}
