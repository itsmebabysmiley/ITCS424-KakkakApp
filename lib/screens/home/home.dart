import 'package:flutter/material.dart';
import 'package:karkarapp/components/custom_bold_underline_text.dart';
import 'package:karkarapp/components/custom_card.dart';
import 'package:karkarapp/components/header_with_searchbar.dart';
import 'package:karkarapp/constaints.dart';
import 'package:karkarapp/models/products.dart';
import 'package:karkarapp/screens/cart/cart.dart';
import 'package:karkarapp/screens/details_screen/detail.dart';
import 'package:karkarapp/screens/more/more.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    CartScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cPrimaryColor,
        automaticallyImplyLeading: false,
        shadowColor: cPrimaryColor,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: cPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeaderWithSearchBar(size: size),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'Recommended'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  recommendProducts.length,
                  (index) => CardItemMedium(
                      product: recommendProducts[index], onTap: ()=>Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: recommendProducts[index],
                        ),
                      )))),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'You may like'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                recommendProducts.length,
                (index) => CardItemMedium(
                  product: maylikeProducts[index],
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: maylikeProducts[index],
                        ),
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomHeadline(title: 'For you'),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                maylikeProducts.length,
                (index) => CardItemWide(
                  product: maylikeProducts[index],
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: maylikeProducts[index]),
                      ),
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
