mixin AssetHelper {
  //Assets in logo
  static const String logo = 'assets/images/logo.png';

  //Assets in icons
  static const String icoOvalTop = 'assets/icons/ico_oval_top.png';
  static const String icoOvalBottom = 'assets/icons/ico_oval_bottom.png';
  static const String icoHotel = 'assets/icons/ico_hotel.png';
  static const String icoPlane = 'assets/icons/ico_plane.png';
  static const String icoHotelPlane = 'assets/icons/ico_hotel_plane.png';
  static const String icoBed = 'assets/icons/ico_bed.png';
  static const String icoCalendal = 'assets/icons/ico_calendal.png';
  static const String icoLocation = 'assets/icons/ico_location.png';
  static const String icoLocationBlank = 'assets/icons/ico_location_blank.png';
  static const String icoStar = 'assets/icons/ico_star.png';
  static const String icoGuest = 'assets/icons/ico_guest.png';
  static const String icoRoom = 'assets/icons/ico_room.png';
  static const String icoDecre = 'assets/icons/ico_decre.png';
  static const String icoIncre = 'assets/icons/ico_incre.png';
  static const String icoWifi = 'assets/icons/ico_wifi.png';
  static const String icoNonRefund = 'assets/icons/ico_non_refund.png';
  static const String icoBreakfast = 'assets/icons/ico_breakfast.png';
  static const String icoNonSmoke = 'assets/icons/ico_non_smoke.png';
  static const String icoUser = 'assets/icons/ico_user.png';
  static const String icoPromo = 'assets/icons/ico_promo.png';

  //Assets in images
  static const String backgroundSplash = 'assets/images/background_splash.png';
  static const String circleSplash = 'assets/images/circle_splash.png';
  static const String hotelScreen = 'assets/images/hotel_screen.png';
  static const String imageMap = 'assets/images/image_map.png';
  static const String slide1 = 'assets/images/slide1.png';
  static const String slide2 = 'assets/images/slide2.png';
  static const String slide3 = 'assets/images/slide3.png';
  static const String person = 'assets/images/person.png';
  static const String hotel1 = 'assets/images/hotel1.png';
  static const String hotel2 = 'assets/images/hotel2.png';
  static const String hotel3 = 'assets/images/hotel3.png';
  static const String room1 = 'assets/images/room1.png';
  static const String room2 = 'assets/images/room2.png';
  static const String room3 = 'assets/images/room3.png';
  static const String coxsbazar = 'assets/images/coxs_bazar.jpg';
  static const String saintmartin = 'assets/images/saint_martin.jpg';
  static const String srimongol = 'assets/images/srimongol.jpg';
  static const String sundarban = 'assets/images/sundarban.jpg';
  static const String kuakata = 'assets/images/kuakata.jpg';
  static const String bandarban = 'assets/images/bandarban.jpg';
}

/* -- App Image Strings -- */

// -- Splash Screen Images
const String tSplashTopIcon = "assets/images/splash_images/splash-top-icon.png";
const String tSplashImage =
    "assets/images/splash_images/splash-screen-image.png";

// -- Welcome Screen Images
// -- also used in Login & SignUp
const String tWelcomeScreenImage =
    "assets/images/welcome_images/welcome-screen-image.png";

// -- Login & SignUp Images
const String tGoogleLogoImage = "assets/icons/google-logo.png";
const String tLoginPic = "assets/images/world_pic.png";
const String tSignupPic = "assets/images/signup_pic.png";

// -- Forget Password Images
const String tForgetPasswordImage =
    "assets/images/forget_password/forget-password.png";
const String tNewPasswordImage = "assets/icons/tick.png";

// -- Deshboard Images
const String tUserProfileImage = "assets/images/deshboard/desh-person.png";
const String tBannerImage1 = "assets/images/deshboard/desh-01.png";
const String tBannerImage2 = "assets/images/deshboard/desh-02.png";
const String tTopCourseImage1 = "assets/images/deshboard/desh-03.png";
const String tTopCourseImage2 = "assets/images/deshboard/desh-04.png";
const String tlogo = "assets/images/logo.png";

// -- Profile Images
const String tProfileImage = "assets/images/person.png";

class AppAsset {
  static String icon(String s) {
    return 'assets/icons/$s';
  }

  static String logo(String s) {
    return 'assets/logos/$s';
  }

  static String image(String s) {
    return 'assets/images/$s';
  }

  static String logoAirline(String airlineCode) {
    if (airlineCode.contains('QZ')) {
      return 'assets/logos/logo_air_asia.png';
    } else if (airlineCode.contains('ID')) {
      return 'assets/logos/logo_batik_air.png';
    } else if (airlineCode.contains('QG')) {
      return 'assets/logos/logo_citilink.png';
    } else if (airlineCode.contains('GA')) {
      return 'assets/logos/logo_garuda_indonesia.png';
    } else if (airlineCode.contains('JT')) {
      return 'assets/logos/logo_lion_air.png';
    } else if (airlineCode.contains('SJ')) {
      return 'assets/logos/logo_sriwijaya_air.png';
    } else if (airlineCode.contains('IU')) {
      return 'assets/logos/logo_super_air_jet.png';
    } else if (airlineCode.contains('IW')) {
      return 'assets/logos/logo_wings_air.png';
    } else {
      return 'assets/logos/logo_garuda_indonesia.png';
    }
  }
}
