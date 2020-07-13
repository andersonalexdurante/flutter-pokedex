// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeAPIStore on _PokeAPIStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeAPI>(() => super.pokeAPI,
              name: '_PokeAPIStoreBase.pokeAPI'))
          .value;
  Computed<Pokemon> _$pokemonAtualComputed;

  @override
  Pokemon get pokemonAtual =>
      (_$pokemonAtualComputed ??= Computed<Pokemon>(() => super.pokemonAtual,
              name: '_PokeAPIStoreBase.pokemonAtual'))
          .value;

  final _$_pokeAPIAtom = Atom(name: '_PokeAPIStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$_pokemonAtualAtom = Atom(name: '_PokeAPIStoreBase._pokemonAtual');

  @override
  Pokemon get _pokemonAtual {
    _$_pokemonAtualAtom.reportRead();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(Pokemon value) {
    _$_pokemonAtualAtom.reportWrite(value, super._pokemonAtual, () {
      super._pokemonAtual = value;
    });
  }

  final _$_PokeAPIStoreBaseActionController =
      ActionController(name: '_PokeAPIStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeAPIStoreBaseActionController.startAction(
        name: '_PokeAPIStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeAPIStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({int index}) {
    final _$actionInfo = _$_PokeAPIStoreBaseActionController.startAction(
        name: '_PokeAPIStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeAPIStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({int index}) {
    final _$actionInfo = _$_PokeAPIStoreBaseActionController.startAction(
        name: '_PokeAPIStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$_PokeAPIStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeAPI: ${pokeAPI},
pokemonAtual: ${pokemonAtual}
    ''';
  }
}
