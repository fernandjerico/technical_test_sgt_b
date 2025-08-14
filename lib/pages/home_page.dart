import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_test_sgt_b/core/theme/app_colors.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Welcome 👋',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey4Color),
                      ),
                      Text(
                        'Albert Stevano',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey10Color),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/123456789?v=4',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintText: 'Search clothes. . . ',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.grey6Color,
                        ),
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/icon-search.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.grey5Color,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.grey5Color,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.grey13Color),
                      child: SvgPicture.asset(
                        'assets/icons/icon-filter.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chipLabels.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: ChoiceChip(
                        showCheckmark: false,
                        label: Row(
                          children: [
                            SvgPicture.asset(
                              chipLabels[index]['icon']!,
                              fit: BoxFit.scaleDown,
                              colorFilter: ColorFilter.mode(
                                  selectedChipIndex == index
                                      ? AppColors.grey2Color
                                      : AppColors.grey13Color,
                                  BlendMode.srcIn),
                            ),
                            SizedBox(width: 8),
                            Text(
                              chipLabels[index]['label']!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: selectedChipIndex == index
                                    ? Colors.white
                                    : AppColors.grey4Color,
                              ),
                            ),
                          ],
                        ),
                        selected: selectedChipIndex == index,
                        onSelected: (selected) {
                          setState(() {
                            selectedChipIndex = index;
                          });
                        },
                        selectedColor: AppColors.grey13Color,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: selectedChipIndex == index
                              ? AppColors.grey13Color
                              : AppColors.grey5Color,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: MasonryGridView.builder(
                  itemCount: items.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              item['image']!,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey10Color,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            item['category']!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey4Color,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text(
                                '\$${item['price']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey13Color,
                                ),
                              ),
                              SizedBox(width: 24),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/icon-star.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    item['rating'].toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey10Color,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
