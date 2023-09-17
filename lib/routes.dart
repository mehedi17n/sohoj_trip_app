import 'package:flutter/material.dart';
import 'package:sohoj_trip_app/representation/screen/check_out_screen.dart';
import 'package:sohoj_trip_app/representation/screen/detail_hotel_screen.dart';
import 'package:sohoj_trip_app/representation/screen/guest_and_room_screen.dart';
import 'package:sohoj_trip_app/representation/screen/hotel_booking_screen.dart';
import 'package:sohoj_trip_app/representation/screen/hotels_screen.dart';
import 'package:sohoj_trip_app/representation/screen/intro_screen.dart';
import 'package:sohoj_trip_app/representation/screen/main_app.dart';
import 'package:sohoj_trip_app/representation/screen/rooms_screen.dart';
import 'package:sohoj_trip_app/representation/screen/search_tour.dart';
import 'package:sohoj_trip_app/representation/screen/select_date_screen.dart';
import 'package:sohoj_trip_app/representation/screen/welcome/welcome_screen.dart';

import 'data/model/hotel_model.dart';
import 'data/model/room_model.dart';

final Map<String, WidgetBuilder> routes = {
  IntroScreen.routeName: (context) => IntroScreen(),
  SearchTourPage.routeName: (context) => SearchTourPage(),
  MainApp.routeName: (context) => MainApp(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
