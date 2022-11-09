import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeImageandBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageandBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokebollImageUrl,
            width: UIHelper.calculatePokeimageAndBollSize(),
            height: UIHelper.calculatePokeimageAndBollSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) {
                return const Icon(Icons.animation);
              },
              width: UIHelper.calculatePokeimageAndBollSize(),
              height: UIHelper.calculatePokeimageAndBollSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
