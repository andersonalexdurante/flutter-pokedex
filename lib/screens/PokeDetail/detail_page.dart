import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/Models/poke_api.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  const PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController _pageController;
  PokeAPIStore _pokemonStore;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokemonStore = GetIt.instance<PokeAPIStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Observer(
            builder: (BuildContext context) {
              return AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Opacity(
                  opacity: 0.0,
                  child: Text(
                    _pokemonStore.getPokemonAtual.name,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                ],
                backgroundColor: _pokemonStore.corPokemonAtual,
                elevation: 0,
              );
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Observer(
              builder: (BuildContext context) {
                return Container(
                  color: _pokemonStore.corPokemonAtual,
                );
              },
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 3,
            ),
            SlidingSheet(
              elevation: 8,
              cornerRadius: 16,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.7, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: 600,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 150,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _pokemonStore.setPokemonAtual(index: index);
                    },
                    itemCount: _pokemonStore.pokeAPI.pokemon.length,
                    itemBuilder: (BuildContext context, int count) {
                      Pokemon _pokeItem =
                          _pokemonStore.getPokemon(index: count);
                      return CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          color: Colors.transparent,
                        ),
                        height: 90,
                        width: 90,
                        imageUrl:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeItem.num}.png',
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
