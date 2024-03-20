import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../model/products_model.dart';
import '../../../global/text_app.dart';

class SearchGridList extends StatelessWidget {
  final List<ProductModel> searchList;
  final Function()? onTap;
  const SearchGridList({super.key, required this.searchList, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width10,
        ),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: searchList.length,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
                mainAxisExtent: 250),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Hero(
                              tag: "${searchList[index].productId}",
                              child: GestureDetector(
                                onTap: onTap,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .22,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              '${ApiConstants.IMAGE_ITEMS}/${searchList[index].productImage}'))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: '\$${searchList[index].productPrice}',
                              fontSize: font20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                            TextApp(
                              text: '${searchList[index].productName}',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ],
                        )
                      ]));
            }));
  }
}
