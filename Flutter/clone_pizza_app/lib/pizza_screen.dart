import 'package:flutter/material.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff868686),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset("images/location.png"),
                          const SizedBox(width: 8),
                          Text(
                            "New York, USA",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 32),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade100,
                    child: Image.asset("images/notifications.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xffF8F8F8),
                ),
                child: Row(
                  children: [
                    Image.asset("images/search.png"),
                    SizedBox(width: 8),
                    Text(
                      "Search your favourite pizza",
                      style: TextStyle(color: Color(0xff868686), fontSize: 16),
                    ),
                    Spacer(),
                    Image.asset("images/filter.png"),
                    SizedBox(width: 4),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Special Offer",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Discount 20% off applied at checkout",
                                    style: TextStyle(
                                      color: Color(0xff868686),
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  SizedBox(
                                    height: 32,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffDD714E),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Order now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(child: Image.asset("images/main_pizza.png")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Popular Pizza",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Color(0xffB55638),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xffB55638),
                    ),
                    onPressed: () {},
                    child: Text(
                      "All Pizzas",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xffF8F8F8),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Vegetarian",
                      style: TextStyle(
                        color: Color(0xff444744),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color(0xffF8F8F8),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Specials",
                      style: TextStyle(
                        color: Color(0xff444744),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
