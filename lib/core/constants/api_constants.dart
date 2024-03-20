class ApiConstants {
  static const String BASE_URL = "https://soukaina.online";
  static const String AUTH_URL = "$BASE_URL/auth/";
  static const String IMAGE_URL = "$BASE_URL/upload";
  static const String IMAGE_ITEMS = "$IMAGE_URL/items";
  static const String IMAGE_CATEGORIES = "$IMAGE_URL/categories";
  static const String IMAGE_BANNERS = "$IMAGE_URL/banners";
  static const String IMAGE_BRANDS = "$IMAGE_URL/brands";
  static const String BACKGROUND_BANNERS = "$IMAGE_URL/backgrounds/";

  ///Authentication
  static const String SIGNUP_URL = "$AUTH_URL/signup.php";
  static const String LOGIN_URL = "$AUTH_URL/login.php";
  static const String VERIFYCODE_URL = "$AUTH_URL/verify_code.php";
  static const String RESEND_URL = "$AUTH_URL/resend.php";

  ///FORGET PASSWORD
  static const String CHECK_EMAIL = "$BASE_URL/forget/check_email.php";
  static const String RESET_PASSWORD = "$BASE_URL/forget/reset_password.php";
  static const String VERIFYCODE_FORGETPASSWORD =
      "$BASE_URL/forget/verify_code_forget.php";

  ///HOME
  static const String HOME_URL = "$BASE_URL/home.php";
  static const String CATEGORIE_URL = "$BASE_URL/categories/view.php";

  ///PRODUCTS
  static const String PRODUCT_URL = "$BASE_URL/products/product.php";

  ///QUESTION
  static const String QUESTION_URL = "$BASE_URL/products/question/question.php";

  ///FAVORITE
  static const String ADD_FAVORITE_URL =
      "$BASE_URL/favorite/add_to_favorite.php";
  static const String REMOVE_FAVORITE_URL = "$BASE_URL/favorite/remove.php";
  static const String VIEW_FAVORITE_URL = "$BASE_URL/favorite/view.php";
  static const String REMOVE_FAVORITE_USER_URL =
      "$BASE_URL/favorite/delete_from_favorite.php";

  ///CART
  static const String ADD_CART_URL = "$BASE_URL/cart/add_to_cart.php";
  static const String REMOVE_CART_URL = "$BASE_URL/cart/remove_from_cart.php";
  static const String GET_COUNT_URL = "$BASE_URL/cart/get_count_product.php";
  static const String VIEW_CART_URL = "$BASE_URL/cart/view.php";
  static const String TEST_CART_URL = "$BASE_URL/cart/test_cart.php";

  ///QUESTION
  static const String FETCH_DETAIL_URL = "$BASE_URL/detail.php";

  ///SEARCH
  static const String SEARCH_PRODUCT_URL = "$BASE_URL/search/search.php";
  static const String SEARCH_QUESTION_URL =
      "$BASE_URL/search/question_search.php";

  ///ADDRESS
  static const String ADD_ADDRESS_URL = "$BASE_URL/address/add.php";
  static const String EDIT_ADDRESS_URL = "$BASE_URL/address/edit.php";
  static const String REMOVE_ADDRESS_URL = "$BASE_URL/address/delete.php";
  static const String VIEW_ADDRESS_URL = "$BASE_URL/address/view.php";

  ///COUPON
  static const String CHECK_COUPON_URL = "$BASE_URL/coupon/check_coupon.php";

  ///ORDER
  static const String CHECKOUT_ORDER_URL = "$BASE_URL/orders/checkout.php";
  static const String PENDING_ORDER_URL = "$BASE_URL/orders/pending_order.php";
  static const String ARCHIVE_ORDER_URL = "$BASE_URL/orders/archive.php";
  static const String DETAIL_ORDER_URL = "$BASE_URL/orders/details.php";
  static const String REMOVE_ORDER_URL = "$BASE_URL/orders/delete.php";
  static const String RATING_ARCHIVE_ORDER_URL = "$BASE_URL/orders/rating.php";

  ///OFFERS
  static const String OFFERS_PRODUCTS_URL = "$BASE_URL/offers/offers.php";
  static const String OFFERS_DETAILS_URL = "$BASE_URL/offers.php";
  static const String LIMITED_OFFERS_URL = "$BASE_URL/offers/get_offers.php";
  static const String UPDATE_COUNT_DOWN_URL =
      "$BASE_URL/offers/update_count_down.php";
  static const String COUNT_DOWN_URL = "$BASE_URL/offers/get_count_down.php";

  ///NOTIFICATION
  static const String FETCH_NOTIFICATION_URL =
      "$BASE_URL/notification/fetch_notification.php";

  ///BANNERS
  static const String FETCH_BANNERS_URL = "$BASE_URL/banners/fetch_banner.php";

  ///BRANDS
  static const String FETCH_BRANDS_URL = "$BASE_URL/brands/fetch_brands.php";

  ///WOMEN
  static const String WOMEN_PRODUCTS_URL = "$BASE_URL/women/women.php";
  static const String SEARCH_WOMEN_PRODUCTS_URL =
      "$BASE_URL/search/women_search.php";

  ///MEN
  static const String MEN_PRODUCTS_URL = "$BASE_URL/men/men.php";
  static const String SEARCH_MEN_PRODUCTS_URL =
      "$BASE_URL/search/men_search.php";

  ///BABY
  static const String BABY_PRODUCTS_URL = "$BASE_URL/baby/baby.php";
  static const String SEARCH_BABY_PRODUCTS_URL =
      "$BASE_URL/search/baby_search.php";

  ///COMPUTER
  static const String COMPUTER_PRODUCTS_URL = "$BASE_URL/computer/computer.php";
  static const String SEARCH_COMPUTER_PRODUCTS_URL =
      "$BASE_URL/search/computer_search.php";

  ///PHONE
  static const String PHONE_PRODUCTS_URL = "$BASE_URL/phone/phone.php";
  static const String SEARCH_PHONE_PRODUCTS_URL =
      "$BASE_URL/search/phone_search.php";

  ///SHOES
  static const String SHOES_PRODUCTS_URL = "$BASE_URL/shoes/shoes.php";
  static const String SEARCH_SHOES_PRODUCTS_URL =
      "$BASE_URL/search/shoes_search.php";

  ///DRESS
  static const String DRESS_PRODUCTS_URL = "$BASE_URL/dress/dress.php";
  static const String SEARCH_DRESS_PRODUCTS_URL =
      "$BASE_URL/search/dress_search.php";

  ///TOP SELLING
  static const String TOP_SELLING_PRODUCTS_URL = "$BASE_URL/dress/dress.php";
  static const String SEARCH_TOP_SELLING_PRODUCTS_URL =
      "$BASE_URL/search/top_selling_search.php";

  ///RATING
  static const String RATING_URL = "$BASE_URL/rating/fetch_rating.php";
}
