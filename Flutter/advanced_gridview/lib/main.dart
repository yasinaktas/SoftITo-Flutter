import 'package:advanced_gridview/models/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdvancedGridView(),
    );
  }
}

class AdvancedGridView extends StatelessWidget {
  const AdvancedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Advanced Gridview"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ProductsGridView(),
    );
  }
}

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    final String mainUrl = "images/";
    List<Product> products = [
      Product(
        name: "Maserati GranTurismo",
        imagePath: "${mainUrl}siyah_araba.png",
        price: 1,
        progress: 96,
        remainingTime: 1,
        totalTicket: 100000,
      ),
      Product(
        name: "Aprilia Tuareg 660",
        imagePath: "${mainUrl}motor.png",
        price: 1,
        progress: 84,
        remainingTime: 2,
        totalTicket: 1000,
      ),
      Product(
        name: "Apple Watch Ultra",
        imagePath: "${mainUrl}saat.png",
        price: 1,
        progress: 80,
        remainingTime: 2,
        totalTicket: 500,
      ),
      Product(
        name: "Maserati Ghibli",
        imagePath: "${mainUrl}gri_araba.png",
        price: 4,
        progress: 46,
        remainingTime: 12,
        totalTicket: 50000,
      ),
      Product(
        name: "GoPro Hero 11 Black",
        imagePath: "${mainUrl}kamera.png",
        price: 1,
        progress: 20,
        remainingTime: 26,
        totalTicket: 500,
      ),
      Product(
        name: "Aprilia RSV4",
        imagePath: "${mainUrl}kirmizi_motor.png",
        price: 2,
        progress: 20,
        remainingTime: 29,
        totalTicket: 5000,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 7,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Card(
        elevation: 0.5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(widget.product.imagePath, height: 65),
                          ],
                        ),
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300,
                          ),
                          child: Text(
                            "${widget.product.price}€",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          height: 24,
                          child: Row(
                            children: [
                              Expanded(
                                flex: widget.product.progress,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    "%${widget.product.progress}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 100 - widget.product.progress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isClicked,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.done_rounded, size: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 0),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  spacing: 2,
                  children: [
                    Row(
                      children: [
                        Text("Remaining Time", style: TextStyle(fontSize: 12)),
                        Spacer(),
                        Text(
                          "${widget.product.remainingTime} Days",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Total Ticket", style: TextStyle(fontSize: 12)),
                        Spacer(),
                        Text(
                          "${widget.product.totalTicket}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                backgroundColor: isClicked
                                    ? Colors.red
                                    : Colors.green,
                              ),
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              child: Text(
                                isClicked ? "Return" : "Buy Ticket",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
