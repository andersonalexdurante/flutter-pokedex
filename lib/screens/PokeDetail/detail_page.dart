import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/Models/poke_api.dart';
import 'package:first_app/consts/consts.dart';
import 'package:first_app/stores/pokeapi_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;

  const PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pokemonStore = Provider.of<PokeAPIStore>(context);
    Pokemon _pokemon = _pokemonStore.getPokemon(index: index);
    return Scaffold(
        backgroundColor: AppConsts.getColorType(type: _pokemon.type[0]),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Opacity(
            opacity: 0.0,
            child: Text(
              _pokemon.name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
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
            Positioned(
              top: 55,
              child: SizedBox(
                height: 150,
                child: PageView.builder(
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
