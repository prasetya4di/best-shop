import 'package:flutter/material.dart';
import 'package:my_marketplace/view/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                    delegate: HomeAppBar(170, _searchController), pinned: true)
              ];
            },
            body: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Item ke - $index"),
                    ),
                  );
                })),
      ),
    );
  }
}
