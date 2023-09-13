import 'package:flutter/material.dart';


import '../../core/helpers/asset_helper.dart';
import '../../data/model/room_model.dart';
import '../widgets/app_bar_container.dart';
import '../widgets/item_room_widget.dart';
import 'check_out_screen.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  static const String routeName = '/rooms_screen';

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Select room',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
              .map(
                (e) => ItemRoomWidget(
                  roomModel: e,
                  onTap: () {
                    Navigator.of(context).pushNamed(CheckOutScreen.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
