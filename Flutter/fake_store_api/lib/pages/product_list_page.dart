import 'package:dio/dio.dart';
import 'package:fake_store_api/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<ProductModel>> products;
  @override
  void initState() {
    super.initState();
    products = getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff5565FB), Color(0xff5599FB)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          leadingWidth: 80,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: 32, color: Colors.white),
            ),
            SizedBox(width: 12),
          ],
          title: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white.withAlpha(50),
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              hintText: "Search Products",
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 56,
            padding: EdgeInsets.only(left: 24, top: 12, bottom: 12),
            child: Row(
              children: [
                Expanded(flex: 5, child: Text("Sort By: Popularity")),
                VerticalDivider(),
                Expanded(flex: 2, child: Center(child: Text("Filter"))),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: products,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> snapshotList = snapshot.data!;
                  return ListView.builder(
                    itemCount: snapshotList.length,
                    itemBuilder: (context, index) {
                      ProductModel product = snapshotList[index];
                      return Image.network(product.image);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      var response = await Dio().get("https://fakestoreapi.com/products");
      List<ProductModel> products = [];
      if (response.statusCode == 200) {
        products = (response.data as List)
            .map((productMap) => ProductModel.fromJson(productMap))
            .toList();
      }
      return products;
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
