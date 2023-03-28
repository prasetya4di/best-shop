import 'package:flutter/material.dart';
import 'package:my_marketplace/generated/l10n.dart';
import 'package:my_marketplace/view/home/viewmodel/home_state.dart';
import 'package:my_marketplace/view/home/viewmodel/home_viewmodel.dart';
import 'package:my_marketplace/view/home/widgets/empty_search.dart';
import 'package:my_marketplace/view/home/widgets/home_app_bar.dart';
import 'package:my_marketplace/view/home/widgets/list_category.dart';
import 'package:my_marketplace/view/home/widgets/list_products.dart';
import 'package:my_marketplace/view/widgets/space_vertical.dart';
import 'package:my_marketplace/view/widgets/text_title.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = context.read();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      viewModel.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = context.watch<HomeViewModel>().state;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
                delegate: HomeAppBar(230, _searchController, (value) {
                  viewModel.searchProducts(value);
                }),
                pinned: true)
          ];
        },
        body: CustomScrollView(
          slivers: state is HomeProductsSearchedState
              ? [
            if (state.products.isNotEmpty)
              SliverToBoxAdapter(
                child: ListProducts(products: state.products),
              ),
            if (state.products.isEmpty)
              SliverList(
                  delegate:
                  SliverChildListDelegate([const EmptySearch()])),
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
    );
  }
}
