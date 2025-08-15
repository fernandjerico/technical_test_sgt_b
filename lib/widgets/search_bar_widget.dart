import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_test_sgt_b/core/theme/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onFilterTap;

  const SearchBarWidget({
    super.key,
    required this.searchController,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: TextFormField(
            controller: searchController,
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
          onTap: onFilterTap,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.grey13Color,
            ),
            child: SvgPicture.asset(
              'assets/icons/icon-filter.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
