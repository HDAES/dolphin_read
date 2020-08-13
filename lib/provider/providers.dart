/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-08-13 22:45:18
 * @LastEditTime: 2020-08-13 22:47:37
 */
import 'package:dolphin_read/provider/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  )
];

/// 需要依赖的model
///
/// UserModel依赖globalFavouriteStateModel
List<SingleChildWidget> dependentServices = [
  
];

List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];


