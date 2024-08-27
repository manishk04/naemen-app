class AppUrl {
  // ============================== Base URL ==================================
  static String baseUrl = "https://www.naemen.digitalnawab.com";

  // ============================== Other URL =================================
  static String appIntroScreenUrl =
      "$baseUrl/customer-api/app/app-intro-screen";
  static String registerUserUrl = "$baseUrl/customer-api/login/register-user";
  static String checkMobileUrl = "$baseUrl/customer-api/login/check-mobile";
  static String loginWithPasswordUrl = "$baseUrl/customer-api/login/login";
  static String loginWithOtpUrl = "$baseUrl/customer-api/login/verify-otp";
  static String resendOtpUrl = "$baseUrl/customer-api/login/resend-otp";

  static String appBannerUrl = "$baseUrl/customer-api/app/app-banner";
  static String homeCategoriesListUrl =
      "$baseUrl/customer-api/app/home-categories-list";
  static String allCategoriesListUrl =
      "$baseUrl/customer-api/app/all-categories-list";
  static String homeTagDataUrl = "$baseUrl/customer-api/app/home-tag-data";
  static String storeDetailsUrl = "$baseUrl/customer-api/app/store-details";
}
