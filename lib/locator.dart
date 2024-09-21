import 'package:app_cor/themes/theme_model.dart';
import  'package:get_it/get_it.dart';

final locator = GetIt.instance; //VARIAVEL GLOBAL PARA ACESSAR EM QUALQUER LUGAR DO APP

void setupDependence() {
  //registra o ThemeModel
  locator.registerSingleton<ThemeModel>(ThemeModel()); // registerSingleton PADRÃO instanciar, só aceita kkkkk
}

