import 'package:flutter/material.dart';

import '../widgets/category_chips_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/product_grid_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int selectedChipIndex = 0;

  final List<Map<String, String>> chipLabels = [
    {'label': 'All Items', 'icon': 'assets/icons/icon-all-items.svg'},
    {'label': 'Dress', 'icon': 'assets/icons/icon-dress.svg'},
    {'label': 'T-Shirts', 'icon': 'assets/icons/icon-tshirt.svg'},
    {'label': 'Jeans', 'icon': 'assets/icons/icon-pants.svg'},
  ];

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/product-1.png',
      'title': 'Modern Light Clothes',
      'category': 'T-Shirt',
      'price': 212.99,
      'rating': 5.0,
    },
    {
      'image': 'assets/images/product-2.png',
      'title': 'Light Dress Bless',
      'category': 'Dress',
      'price': 162.99,
      'rating': 5.0,
    },
    {
      'image': 'assets/images/product-3.png',
      'title': 'Light Dress Modern',
      'category': 'Dress',
      'price': 122.99,
      'rating': 5.0,
    },
    {
      'image': 'assets/images/product-4.png',
      'title': 'Light Dress Yellow',
      'category': 'Dress',
      'price': 122.99,
      'rating': 5.0,
    },
  ];

  void _onCategorySelected(int index) {
    setState(() {
      selectedChipIndex = index;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(
                userName: 'Albert Stevano',
                avatarUrl:
                    'https://avatars.githubusercontent.com/u/123456789?v=4',
              ),
              SizedBox(height: 16),
              SearchBarWidget(
                searchController: _searchController,
                onFilterTap: () {},
              ),
              SizedBox(height: 32),
              CategoryChipsWidget(
                categories: chipLabels,
                selectedIndex: selectedChipIndex,
                onCategorySelected: _onCategorySelected,
              ),
              SizedBox(height: 24),
              ProductGridWidget(
                items: items,
                onItemTap: (item) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
