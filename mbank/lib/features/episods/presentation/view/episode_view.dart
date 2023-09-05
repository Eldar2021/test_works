import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:mbank/components/components.dart';
import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';
import 'package:mbank/utils/show/sheet.dart';
import 'package:mbank/utils/utils.dart';

class EpisodsView extends StatefulWidget {
  const EpisodsView({super.key});

  @override
  State<EpisodsView> createState() => _EpisodsViewState();
}

class _EpisodsViewState extends State<EpisodsView> with PaginationMixin<Episode, EpisodsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episods'),
        actions: [
          IconButton(
            onPressed: () {
              AppBottomSheet.showBottomSheet(
                context,
                (c, s) => SeractEpisods(pageController, scrollController: s),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PagedListView<int, Episode>(
        pagingController: pageController,
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 30),
        builderDelegate: PagedChildBuilderDelegate<Episode>(
          itemBuilder: (context, item, index) => EpisodeCard(item),
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
  Future<(List<Episode>?, int?, MbankException?)> fetchData(int page) {
    return context.read<EpisodeCubit>().getEpisods(page);
  }
}
