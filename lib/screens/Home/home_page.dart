import 'package:first_app/Models/poke_api.dart';
import 'package:first_app/consts/consts.dart';
import 'package:first_app/screens/Home/Widgets/app_bar.dart';
import 'package:first_app/screens/Home/Widgets/poke_item.dart';
import 'package:first_app/screens/PokeDetail/detail_page.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;
    final _pokemonStore = Provider.of<PokeAPIStore>(context);
    if (_pokemonStore.pokeAPI == null) {
      _pokemonStore.fetchPokemonList();
    }
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
                    PokeAPI _pokeAPI = _pokemonStore.pokeAPI;
                    return (_pokeAPI != null)
                        ? AnimationLimiter(
                            child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(8),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: _pokeAPI.pokemon.length,
                                itemBuilder: (context, index) {
                                  Pokemon pokemon =
                                      _pokemonStore.getPokemon(index: index);
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: 2,
                                    child: ScaleAnimation(
                                      child: GestureDetector(
                                        child: PokeItem(
                                          index: index,
                                          name: pokemon.name,
                                          types: pokemon.type,
                                          num: pokemon.num,
                                        ),
                                        onTap: () {
                                          _pokemonStore.setPokemonAtual(
                                              index: index);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PokeDetailPage(
                                                            index: index),
                                                fullscreenDialog: true,
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                }),
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
