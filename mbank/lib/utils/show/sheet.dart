import 'package:flutter/material.dart';

@immutable
final class AppBottomSheet {
  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget Function(BuildContext, ScrollController) builder, {
    double initialChildSize = 0.8,
    Key? scrollKey,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: builder,
        );
      },
    );
  }
}
