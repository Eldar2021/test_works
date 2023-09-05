import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbank/features/features.dart';

class CharacterStatusFilter extends StatelessWidget {
  const CharacterStatusFilter(this.refrash, {super.key});
  final Function() refrash;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CharacterCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile.adaptive(
          title: Text(CharacterStatus.alive.name),
          value: CharacterStatus.alive == cubit.state.characterStatus,
          onChanged: (v) {
            context.read<CharacterCubit>().changeFilterStautus(CharacterStatus.alive);
            refrash();
          },
        ),
        SwitchListTile.adaptive(
          title: Text(CharacterStatus.dead.name),
          value: CharacterStatus.dead == cubit.state.characterStatus,
          onChanged: (v) {
            context.read<CharacterCubit>().changeFilterStautus(CharacterStatus.dead);
            refrash();
          },
        ),
      ],
    );
  }
}
