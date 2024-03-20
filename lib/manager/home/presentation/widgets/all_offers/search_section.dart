import 'package:flutter/material.dart';
import 'package:shop/manager/home/presentation/widgets/form_container_home.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/dimensions.dart';

class SearchSection extends StatelessWidget {
  const SearchSection(
      {super.key,
      this.onChanged,
      this.controller,
      this.onPressedSearch,
      this.onFilter});
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function()? onPressedSearch;
  final void Function()? onFilter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .06,
      margin: EdgeInsets.symmetric(horizontal: width10),
      child: Row(
        children: [
          Expanded(
              child: FormContainerHome(
            onChanged: onChanged,
            controller: controller,
            hintText: "Search Offers...",
            isFilled: true,
            isPrefix: false,
            fillColor: Colors.grey[200],
            onSearch: onPressedSearch,
          )),
          sizeHorizontal(width10),
          GestureDetector(
            onTap: onFilter,
            child: Container(
              width: MediaQuery.of(context).size.width * .13,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  Icons.filter_list_outlined,
                  color: Colors.grey[500]!,
                  size: 21,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
