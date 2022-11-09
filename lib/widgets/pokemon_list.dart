import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/services/service.dart';
import 'package:pokedex_app/widgets/pokemon_item.dart';

import '../model/pokemon_model.dart';

class PokemonList extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = Service.getPokeList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) =>
                    PokemonItem(pokemon: listem[index])),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Hata Var'));
        } else {
          return const Center(child: (CircularProgressIndicator()));
        }
      },
    );
  }
}

//gridview yerine listview kullanmak istersen bunu tercih edebilirsin.


// ListView.builder(
//             itemCount: _listem.length,
//             itemBuilder: (context, index) {
//               var oankiPokemon = _listem[index];

//               return PokemonItem(pokemon: oankiPokemon);
//             },
//           );
//         } s