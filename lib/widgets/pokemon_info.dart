import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildInfoRow('Name', pokemon.name),
            buildInfoRow('Height', pokemon.height),
            buildInfoRow('Weight', pokemon.weight),
            buildInfoRow('Spawn Time', pokemon.spawnTime),
            buildInfoRow('Weakness', pokemon.weaknesses),
            buildInfoRow('Pre Evulation', pokemon.prevEvolution),
            buildInfoRow('Next Evulation', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  buildInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getValueTextStyle(),
          )
        else if (value == null)
          Text('Not Available', style: Constants.getValueTextStyle())
        else
          Text(value, style: Constants.getValueTextStyle())
      ],
    );
  }
}
