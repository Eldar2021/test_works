import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mbank/core/core.dart';

mixin PaginationMixin<P, T extends StatefulWidget> on State<T> {
  final pageController = PagingController<int, P>(firstPageKey: 1);
  Future<(List<P>?, int?, MbankException?)> fetchData(int page);

  @override
  void initState() {
    pageController.addPageRequestListener(fetchPage);
    super.initState();
  }

  Future<void> fetchPage(int page) async {
    final (newItems, pagesCount, exception) = await fetchData(page);
    if (newItems != null) {
      if (page == pagesCount) {
        pageController.appendLastPage(newItems);
      } else {
        pageController.appendPage(newItems, page + 1);
      }
    } else {
      pageController.error = exception;
    }
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
