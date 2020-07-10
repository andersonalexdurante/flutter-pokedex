import 'package:first_app/Models/poke_api.dart';
import 'package:first_app/consts/consts.dart';
import 'package:first_app/screens/Home/Widgets/app_bar.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeAPIStore pokeAPIStore;
  @override
  void initState() {
    super.initState();
    pokeAPIStore = PokeAPIStore();
    pokeAPIStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(overflow: Overflow.visible, children: <Widget>[
          Positioned(
            top: -200 / 4.5,
            left: screenWidth - (200 / 1.5),
            child: Opacity(
              opacity: 0.1,
              child:
                  Image.asset(AppConsts.blackPokeball, height: 200, width: 200),
            ),
          ),
          Container(
            child: Column(children: <Widget>[
              Container(
                height: statusBar,
              ),
              AppHeader(),
              Expanded(
                child: Container(child: Observer(
                  builder: (BuildContext context) {
                    PokeAPI _pokeAPI = pokeAPIStore.pokeAPI;
                    return (_pokeAPI != null)
                        ? ListView.builder(
                            itemCount: _pokeAPI.pokemon.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(_pokeAPI.pokemon[index].name));
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                )),
              )
            ]),
          )
        ]));
  }
}
