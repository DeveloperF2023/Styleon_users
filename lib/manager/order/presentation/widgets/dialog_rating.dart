import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../controller/archive_order_controller.dart';

showDialogOfRating(BuildContext context, String orderId) {
  return showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
// your app's name?
            title: Text(
              'Rating',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: font25,
                fontWeight: FontWeight.bold,
              ),
            ),
// encourage your user to leave a high rating?
            message: Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: font16, color: AppColors.textColor),
            ),
// your app's logo?
            submitButtonText: 'Submit',
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              ArchiveOrderControllerImpl archiveOrderControllerImpl =
                  Get.find();
              archiveOrderControllerImpl.ratingArchiveOrder(
                  orderId, response.rating, response.comment);
              print(
                  'rating: ${response.rating}, comment: ${response.comment} order ID: $orderId');
              if (response.rating < 3.0) {
// send their comments to your email or anywhere you wish
// ask the user to contact you instead of leaving a bad review
              } else {}
            },
          ));
}
