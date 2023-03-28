import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_marketplace/data/model/entity/user.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/util/constants/routes.dart';
import 'package:my_marketplace/view/profile/viewmodel/profile_state.dart';
import 'package:my_marketplace/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:my_marketplace/view/profile/widgets/logout_button.dart';
import 'package:my_marketplace/view/profile/widgets/profile_info.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = context.read();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileViewModel>().user;
    ProfileState state = context.watch<ProfileViewModel>().state;

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      if (state is ProfileLogoutState) {
        context.go(Routes.login);
      } else if (state is ProfileIdleState) {
        viewModel.getUser();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileInfo(
                  label: S.of(context).textEmail, text: user?.email ?? ""),
              ProfileInfo(
                  label: S.of(context).textName, text: user?.name ?? ""),
              ProfileInfo(
                  label: S.of(context).textAddress, text: user?.address ?? ""),
              ProfileInfo(
                  label: S.of(context).textBirthday,
                  text: DateFormat("dd MMMM yyyy")
                      .format(user?.birthDate ?? DateTime.now())),
              const SpaceVertical(size: 18),
              const LogoutButton()
            ],
          ),
        ),
      ),
    );
  }
}
