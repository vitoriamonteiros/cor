import 'package:app_cor/themes/enums.dart';
import 'package:app_cor/themes/theme_blue.dart';
//import 'package:app_cor/themes/theme_green.dart';
//import 'package:app_cor/themes/theme_grey.dart';
//import 'package:app_cor/themes/theme_indigo.dart';
import 'package:app_cor/themes/theme_orange.dart';
//import 'package:app_cor/themes/theme_purple.dart';
import 'package:app_cor/themes/theme_red.dart';
//import 'package:app_cor/themes/theme_teal.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeModel extends ChangeNotifier {  // o ChangeNotifier vai notificar se o tema for alterado ou nao 
  ThemeData _currentTheme = themeOrange; // tema padrão se nao for alterado/ mexido

  ThemeData get currentTheme => _currentTheme; //get criando o tema

  ThemeModel() {  //construtor sem argumento, primeira coisa que se faz // atualiza o tema
    updateTheme();
  }

// ta chamando o tema
  updateTheme() {
    _currentTheme = getThemeCustom(); // atribuindo tema para a propriedade _currentTheme para o get que está embaixo
    return notifyListeners(); //notificar/ envio, independente do que é . não é um problema se ninguem receber. GERENCIAR ESTADO NATIVO NO FLUTTER
  }

  ThemeData getThemeCustom() {
    final box = GetStorage(); // está instanciando e jogando
    final themeColor = strToEnumTema(box.read('tema') ?? 'orange'); // está fazendo uma conversão se está algo gravado quando abrir o tela, senao volta para o laranja. evitando quebrar o tema

    final result = switch (themeColor) { // devolvendo o arquivo de tema
      ColorTema.blue => themeBlue,
      ColorTema.orange => themeOrange,
      ColorTema.red => themeRed,
      _ => themeOrange, // pega o arquivo inteiro
    };                   // e
    return result; // retorna
  }

  ColorTema strToEnumTema(String? value) { // para converter uma string para enumerado (strToEnumTema criou)
    final result = switch (value) {
      'Blue' => ColorTema.blue,
      'Orange' => ColorTema.orange,
      'Red' => ColorTema.red,
      _ => ColorTema.orange,
    };
    return result;
  }
}
