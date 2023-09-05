import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin PaginationMixin<P, T extends StatefulWidget> on State<T> {
  final pagingController = PagingController<int, P>(firstPageKey: 0);
  Future<(List<P>?, int?, Exception?)> fetchData(int page);

  @override
  void initState() {
    pagingController.addPageRequestListener(fetchPage);
    super.initState();
  }

  Future<void> fetchPage(int page) async {
    final (newItems, pagesCount, exception) = await fetchData(page);
    if (newItems != null) {
      if (page == pagesCount) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, page + 1);
      }
    } else {
      pagingController.error = exception;
    }
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }
}
