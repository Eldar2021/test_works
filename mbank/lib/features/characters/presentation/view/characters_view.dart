import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mbank/features/features.dart';
import 'package:mbank/utils/utils.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> with PaginationMixin<Character, CharactersView> {
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
                  child: CharacterStatusFilter(pageController.refresh),
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
      body: PagedListView<int, Character>(
        pagingController: pageController,
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
      ),
    );
  }

  @override
  Future<(List<Character>?, int?, Exception?)> fetchData(int page) {
    return context.read<CharacterCubit>().getCharacters(page);
  }
}
