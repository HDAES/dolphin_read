
//是否完结
String isEnd(int status){
  switch(status){
    case 1 :
      return '完结';
      break;
    case 2 :
      return '连载';
      break;
    default :
      return '未知';
  }
}