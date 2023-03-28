import 'package:flutter/material.dart';
import 'package:my_marketplace/data/model/entity/category.dart';
import 'package:my_marketplace/view/home/viewmodel/home_state.dart';
import 'package:my_marketplace/view/home/viewmodel/home_viewmodel.dart';
import 'package:my_marketplace/view/home/widgets/home_app_bar.dart';
import 'package:my_marketplace/view/home/widgets/list_category.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = context.read();
    HomeState state = context.watch<HomeViewModel>().state;
    List<Category> categories = context.watch<HomeViewModel>().categories;
    viewModel.init();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      if (state is HomeIdleState) {
        viewModel.getProducts();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                  delegate: HomeAppBar(170, _searchController), pinned: true)
            ];
          },
          body: Column(
            children: [
              ListCategory(categories: categories),
            ],
          ),
        ),
      ),
    );
  }
}
