import 'package:flutter/material.dart';

class NestedTabbarOrnek extends StatefulWidget {
  const NestedTabbarOrnek({super.key});

  @override
  State<NestedTabbarOrnek> createState() => _NestedTabbarOrnekState();
}

class _NestedTabbarOrnekState extends State<NestedTabbarOrnek> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Nested Tabbar"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Kategori-1"),
              Tab(text: "Kategori-2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InnerTabView(kategoriName: "Kategori 1"),
            Center(child: Text("Kategori 2")),
          ],
        ),
      ),
    );
  }
}

class InnerTabView extends StatelessWidget {
  final String kategoriName;
  const InnerTabView({super.key, required this.kategoriName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "Alt Kategori A"),
              Tab(text: "Alt Kategori B"),
              Tab(text: "Alt Kategori C"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("Kategori A")),
                Center(child: Text("Kategori B")),
                Center(child: Text("Kategori C")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
