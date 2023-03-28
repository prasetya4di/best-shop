import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/home/viewmodel/home_state.dart';
import 'package:my_marketplace/view/home/viewmodel/home_viewmodel.dart';
import 'package:my_marketplace/view/home/widgets/home_app_bar.dart';
import 'package:my_marketplace/view/home/widgets/list_category.dart';
import 'package:my_marketplace/view/home/widgets/list_products.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = context.read();
    HomeState state = context.watch<HomeViewModel>().state;
    viewModel.init();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      if (state is HomeIdleState) {
        viewModel.getProducts();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                  delegate: HomeAppBar(170, _searchController, (value) {
                    viewModel.searchProducts(value);
                  }),
                  pinned: true)
            ];
          },
          body: CustomScrollView(
            slivers: state is HomeProductsSearchedState
                ? [
                    SliverToBoxAdapter(
                      child: ListProducts(products: state.products),
                    )
                  ]
                : [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ListCategory(
                          categories:
                              context.watch<HomeViewModel>().categories),
                      const SpaceVertical(),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12),
                        child:
                            TextTitle.medium(text: S.of(context).textProduct),
                      ),
                    ])),
                    SliverToBoxAdapter(
                      child: ListProducts(
                          products: context.watch<HomeViewModel>().products),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
