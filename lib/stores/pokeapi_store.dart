import 'dart:convert';
import 'package:first_app/Models/poke_api.dart';
import 'package:first_app/consts/consts.dart';
import 'package:first_app/consts/consts_api.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeAPIStore = _PokeAPIStoreBase with _$PokeAPIStore;

abstract class _PokeAPIStoreBase with Store {
  @observable
  PokeAPI _pokeAPI;

  @observable
  Pokemon _pokemonAtual;

  @observable
  Color corPokemonAtual;

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed
  Pokemon get pokemonAtual => _pokemonAtual;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  Pokemon getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  Pokemon get getPokemonAtual {
    return _pokemonAtual;
  }

  @action
  setPokemonAtual({int index}) {
    _pokemonAtual = _pokeAPI.pokemon[index];
    corPokemonAtual = AppConsts.getColorType(type: _pokemonAtual.type[0]);
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstAPI.pokeAPIURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
