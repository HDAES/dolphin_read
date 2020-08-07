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