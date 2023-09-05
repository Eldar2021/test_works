import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class AppAlert {
  static Future<T?> showLoading<T>(BuildContext context) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CupertinoActivityIndicator(
                color: Theme.of(context).colorScheme.primary,
                radius: 16,
              ),
            ),
          ),
          content: const Text(
            'Loading...',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  static void showErrorDialog(
    BuildContext context, {
    required String errorText,
    Widget? title,
    void Function()? onPressed,
    TextStyle? textStyle,
  }) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Error!'),
          content: Text(errorText, style: textStyle),
          actions: <Widget>[
            CupertinoButton(
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
              child: Text('cancel', style: textStyle),
            ),
          ],
        );
      },
    );
  }

  static void showDialog(BuildContext context, {required Widget title, Widget? content}) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            CupertinoButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('ok'),
            ),
          ],
        );
      },
    );
  }
}
