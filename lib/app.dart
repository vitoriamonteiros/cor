
import 'package:app_cor/page.dart';
import 'package:app_cor/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder( // quem vai
      animation: GetIt.instance<ThemeModel>(), 
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          //ele ta pegando o ThemeModel e faz a troca de do tema
          theme: GetIt.instance<ThemeModel>().currentTheme, // aqui faz a troca de do tema --- ele pega o que está reservado e coloca como tema atual
          home: MyHomePage (title: 'Temas',),
      );
    });
  }
}