
import 'package:dolphin_read/common/utils/storage.dart';

List<Map> getHistoryList(){
  return StorageUtil().getStringList('SEARCH_HISTORY');
}


Future<bool> setSearchHistory(Map newHistory){
  
  List<Map> tempList = [];
  List<Map> oldHistoryList = getHistoryList();
  bool isIn = false;
  if(oldHistoryList.length>0){
    oldHistoryList.forEach((item){
      if(item['searchKey'] == newHistory['searchKey']){
        isIn = true;
      }
      tempList.add(item);
    });
    if(!isIn) tempList.add(newHistory);
  }else{
    tempList.add(newHistory);
  }

  return StorageUtil().setStringList('SEARCH_HISTORY',tempList);
}

Future<bool> removeHistory(){
   return StorageUtil().remove('SEARCH_HISTORY');
}