import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final double height;
  final double centerButtonSize;
  final int selectedIndex;
  final Function(int index) onItemSelected;
  final Function(bool selected) onCenterButtonPressed;
  const CustomBottomNavBar({
    super.key,
    this.height = 56,
    this.centerButtonSize = 72,
    this.selectedIndex = 0,
    required this.onCenterButtonPressed,
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final selectedColor = const Color.fromARGB(255, 0, 78, 142);
  bool isCenterButtonSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, -2),
          ),
        ],
      ),
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Ana Sayfa",
                icon: Icons.home_outlined,
                index: 0,
                onTap: (widget.onItemSelected),
                isSelected: widget.selectedIndex == 0,
              ),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Kategoriler",
                icon: Icons.menu,
                index: 1,
                onTap: (widget.onItemSelected),
                isSelected: widget.selectedIndex == 1,
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 20)),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Sepetim",
                icon: Icons.shopping_bag_rounded,
                index: 2,
                onTap: (widget.onItemSelected),
                isSelected: widget.selectedIndex == 2,
              ),
              BottomNavMenuItem(
                height: widget.height * 0.8,
                title: "Favorilerim",
                icon: Icons.favorite_outline,
                index: 3,
                onTap: (widget.onItemSelected),
                isSelected: widget.selectedIndex == 3,
              ),
            ],
          ),
          Positioned(
            top:
                -(widget.centerButtonSize /
                    2), // Yarıdan dışarı taşacak şekilde ayarla
            left:
                MediaQuery.of(context).size.width / 2 -
                (widget.centerButtonSize /
                    2), // Ortalamak için (Container genişliği - çember genişliği)/2
            child: Container(
              width: widget.centerButtonSize,
              height: widget.centerButtonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                  width: widget.centerButtonSize * 0.075,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isCenterButtonSelected = !isCenterButtonSelected;
                    widget.onCenterButtonPressed(isCenterButtonSelected);
                  });
                },
                icon: Icon(
                  isCenterButtonSelected
                      ? Icons.close
                      : Icons.grid_view_rounded,
                  color: Colors.white,
                  size: widget.centerButtonSize * 0.55,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final int index;
  final Function(int index) onTap;
  final double height;
  const BottomNavMenuItem({
    super.key,
    required this.height,
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = const Color.fromARGB(255, 0, 78, 142);
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Column(
        children: [
          isSelected
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SizedBox(
                    width: height,
                    child: Divider(
                      radius: BorderRadius.circular(2),
                      color: selectedColor,
                      height: 3,
                      thickness: 3,
                    ),
                  ),
                )
              : SizedBox(height: 8),
          Icon(icon, color: isSelected ? selectedColor : Colors.black),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? selectedColor : Colors.black,
              fontSize: 12,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
