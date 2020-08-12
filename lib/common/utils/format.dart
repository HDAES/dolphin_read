/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-07 20:55:25
 * @LastEditTime: 2020-08-07 22:37:44
 */

//是否完结
String isEnd(status){
  switch(status.toString()){
    case '1' :
      return '完结';
      break;
    case '2' :
      return '连载';
      break;
    default :
      return '未知';
  }
}

String formatPlatform(int type){
  switch(type){
    case 0 :
      return '小海豚';
      break;
    case 1 :
      return  '平板电子书网';
      break;
    case 2 :
      return  '笔趣阁';
      break;
    default :
      return '未知';
  }
}