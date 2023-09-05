import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:mbank/components/components.dart';
import 'package:mbank/core/core.dart';
import 'package:mbank/features/features.dart';

class SeractEpisods extends StatelessWidget {
  const SeractEpisods(this.controller, {super.key, required this.scrollController});

  final PagingController<int, Episode> controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const SizedBox(
          height: 30,
          child: Icon(Icons.maximize_rounded, size: 50),
        ),
        TextFormField(
          onChanged: (value) async {
            await Future.value(const Duration(milliseconds: 700));
            if (context.mounted) {
              context.read<EpisodeCubit>().changeSeractName(value);
              controller.refresh();
            }
          },
        ),
        Expanded(
          child: PagedListView<int, Episode>(
            pagingController: controller,
            scrollController: scrollController,
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
        ),
      ],
    );
  }
}
