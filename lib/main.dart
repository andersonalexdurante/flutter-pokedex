import 'package:first_app/screens/Home/home_page.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeAPIStore>(PokeAPIStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage());
  }
}
