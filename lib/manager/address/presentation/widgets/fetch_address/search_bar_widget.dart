import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../global/form_container.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key, this.onPressedSearch, this.onChanged, this.controller});
  final Function()? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .06,
        child: Row(
          children: [
            Expanded(
                child: FormContainer(
              controller: controller,
              hintText: "Search Address",
              isFilled: true,
              isPrefix: false,
              fillColor: Colors.grey[100],
              onSearch: onPressedSearch,
            )),
            sizeHorizontal(10),
            Container(
              width: MediaQuery.of(context).size.width * .13,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(
                  EneftyIcons.notification_outline,
                  color: Colors.grey[500]!,
                  size: 21,
                ),
              ),
            ),
            sizeHorizontal(10),
          ],
        ),
      ),
    );
  }
}
