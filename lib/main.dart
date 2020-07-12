import 'package:first_app/screens/Home/home_page.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<PokeAPIStore>(
          create: (_) => PokeAPIStore(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pokédex',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: HomePage()),
    );
  }
}
