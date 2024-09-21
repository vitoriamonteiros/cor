import 'package:app_cor/locator.dart';
import 'package:app_cor/themes/enums.dart';
import 'package:app_cor/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State <MyHomePage> {
  final box = GetStorage(); 
  late ColorTema _corTema;

  @override
  void initState() { // criação 
    super.initState();
    _corTema = locator.get<ThemeModel>().strToEnumTema(box.read('tema')); // locator verifica as classes registradas 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tema'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChoiceChip( //representa uma opção selecionavel dentro do conjuto de opções 
                checkmarkColor: Colors.white, //é o icone de check
                label: Text('Red'),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                selected: (_corTema == ColorTema.red),
                selectedColor: Colors.red, //background do botao ta selecionado 
                backgroundColor: Colors.red, //background do botao quando nao ta selecionado 
                onSelected: (value) {
                  if (value) {
                    _corTema = ColorTema.red; //atualizando vermelho
                    box.write('tema', 'Red'); //armazando o tema no getStorage
                    locator.get<ThemeModel>().updateTheme(); //nao é chamado o construtor da class, ele chamado uma unica vez, isso só muda o tema no caso
                  }
                  setState(() {});
                },
              ),
              ChoiceChip(
                checkmarkColor: Colors.white,
                label: Text('Blue'),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                selected: (_corTema == ColorTema.blue),
                selectedColor: Colors.blue,
                backgroundColor: Colors.blue,
                onSelected: (value) {
                  if (value) {
                    _corTema = ColorTema.blue;
                    box.write('tema', 'Blue');
                    locator.get<ThemeModel>().updateTheme();
                  }
                  setState(() {});
                },
              ),
              ChoiceChip(
                checkmarkColor: Colors.white,
                label: Text('Orange'),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                selected: (_corTema == ColorTema.orange),
                selectedColor: Colors.orange,
                backgroundColor: Colors.orange,
                onSelected: (value) {
                  if (value) {
                    _corTema = ColorTema.orange;
                    box.write('tema', 'Orange');
                    locator.get<ThemeModel>().updateTheme();
                  }
                  setState(() {});
                },
              ),
            ]),
      ),
    );
  }
}


  


