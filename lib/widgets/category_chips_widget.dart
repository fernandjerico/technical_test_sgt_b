import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_test_sgt_b/core/theme/app_colors.dart';

class CategoryChipsWidget extends StatelessWidget {
  final List<Map<String, String>> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryChipsWidget({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 16),
              child: ChoiceChip(
                showCheckmark: false,
                label: Row(
                  children: [
                    SvgPicture.asset(
                      categories[index]['icon']!,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          selectedIndex == index
                              ? AppColors.grey2Color
                              : AppColors.grey13Color,
                          BlendMode.srcIn),
                    ),
                    SizedBox(width: 8),
                    Text(
                      categories[index]['label']!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: selectedIndex == index
                            ? Colors.white
                            : AppColors.grey4Color,
                      ),
                    ),
                  ],
                ),
                selected: selectedIndex == index,
                onSelected: (selected) {
                  onCategorySelected(index);
                },
                selectedColor: AppColors.grey13Color,
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: selectedIndex == index
                      ? AppColors.grey13Color
                      : AppColors.grey5Color,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            );
          },
        ));
  }
}
