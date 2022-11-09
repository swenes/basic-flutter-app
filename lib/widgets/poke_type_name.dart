import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../constants/ui_helper.dart';
import '../model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeTypeName({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: UIHelper.getIconButtonPading(),
          child: IconButton(
            iconSize: 24.w,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(pokemon.name!,
                    style: Constants.getDetailPokemonNameTextStyle()),
                SizedBox(
                  height: 0.02.sh,
                ),
                Chip(
                  label: Text(
                    pokemon.type!.join(' , '),
                    style: Constants.getTypeChipTextStyle(),
                  ),
                ),
              ],
            ),
            Text('#${pokemon.num!}',
                style: Constants.getDetailPokemonNameTextStyle()),
          ],
        ),
      ]),
    );
  }
}
