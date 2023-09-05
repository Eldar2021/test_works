import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbank/components/components.dart';

import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';
import 'package:mbank/utils/show/sheet.dart';
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
          IconButton(
            onPressed: () {
              AppBottomSheet.showBottomSheet(
                context,
                (c, s) => SeractCharacter(pageController, scrollController: s),
              );
            },
            icon: const Icon(Icons.search),
          ),
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
          itemBuilder: (context, item, index) => CharacterCard(item),
          firstPageErrorIndicatorBuilder: (context) {
            final exception = context.read<CharacterCubit>().state.exception;
            return ErrorView(exception ?? UnknownException());
          },
          newPageErrorIndicatorBuilder: (context) {
            final exception = context.read<CharacterCubit>().state.exception;
            return ErrorView(exception ?? UnknownException());
          },
        ),
      ),
    );
  }

  @override
  Future<(List<Character>?, int?, MbankException?)> fetchData(int page) {
    return context.read<CharacterCubit>().getCharacters(page);
  }
}
