import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constants/dimensions.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width10,vertical: height10),
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: font20,),
          ),
        ),
      ),
    );
  }
}
