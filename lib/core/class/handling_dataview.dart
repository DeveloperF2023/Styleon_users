import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/image_assets.dart';
import '../enum/status_request.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAssets.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child:
                    Lottie.asset(ImageAssets.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(ImageAssets.server,
                        width: 250, height: 250))
                : widget;
  }
}
