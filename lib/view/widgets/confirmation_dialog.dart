import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/widgets/base_dialog.dart';
import 'package:my_marketplace/view/widgets/space_horizontal.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';

Future<bool> showConfirmationDialog(
    BuildContext context, String message) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return BaseDialog(
            onCloseTap: () {
              Navigator.pop(context, false);
            },
            title: S.of(context).textConfirmation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message),
                const SpaceVertical(size: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text(S.of(context).textNo),
                      ),
                    ),
                    const SpaceHorizontal(),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: Text(S.of(context).textYes)),
                    )
                  ],
                )
              ],
            ));
      });
}
