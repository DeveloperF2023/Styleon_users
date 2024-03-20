import 'package:shop/core/enum/status_request.dart';

handlingData(response) {
  if (response is StatusRequest) {
   return response;
  }
    else {
      return StatusRequest.success;
    }
  }

