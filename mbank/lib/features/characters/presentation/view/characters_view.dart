import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mbank/features/features.dart';
import 'package:mbank/utils/utils.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          TextButton.icon(
            onPressed: () {
              AppAlert.showDialog(
                context,
                title: const Text('Filter By Status'),
                content: BlocProvider.value(
                  value: context.read<CharacterCubit>(),
                  child: const CharacterStatusFilter(),
                ),
              );
            },
            icon: const Icon(Icons.sort),
            label: BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                return Text(state.characterStatus?.name ?? '');
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          // return const CharacterViewBody();
          return switch (state.status) {
            FetchStatus.failure => const Text('Error!'),
            FetchStatus.loading => const Center(child: CircularProgressIndicator()),
            FetchStatus.success => const CharacterViewBody(),
          };
        },
      ),
    );
  }
}

class CharacterViewBody extends StatefulWidget {
  const CharacterViewBody({super.key});

  @override
  State<CharacterViewBody> createState() => _CharacterViewBodyState();
}

class _CharacterViewBodyState extends State<CharacterViewBody> with PaginationMixin<Character, CharacterViewBody> {
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Character>(
      pagingController: pagingController,
      padding: const EdgeInsets.fromLTRB(14, 20, 14, 30),
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(item.image),
            ),
            title: Text(item.name),
            subtitle: Text('${item.species}  ${item.status.name}'),
            trailing: Text('${item.id}'),
          ),
        ),
      ),
    );
  }

  @override
  Future<(List<Character>?, int?, Exception?)> fetchData(int page) {
    return context.read<CharacterCubit>().getCharacters(page);
  }
}

class CharacterStatusFilter extends StatelessWidget {
  const CharacterStatusFilter({super.key});

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
          },
        ),
        SwitchListTile.adaptive(
          title: Text(CharacterStatus.dead.name),
          value: CharacterStatus.dead == cubit.state.characterStatus,
          onChanged: (v) => context.read<CharacterCubit>().changeFilterStautus(CharacterStatus.dead),
        ),
      ],
    );
  }
}
