import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:my_marketplace/view/widgets/asset_colors.dart';
import 'package:my_marketplace/view/widgets/confirmation_dialog.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showConfirmationDialog(context, S.of(context).textLogoutConfirmation)
            .then((value) {
          if (value) {
            context.read<ProfileViewModel>().logout();
          }
        });
      },
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: const EdgeInsets.all(12),
          backgroundColor: AssetColors.red100),
      child: Text(
        S.of(context).textLogout,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
