import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/core/extensions/date_ext.dart';
import 'package:sohoj_trip_app/representation/screen/main_app.dart';
import 'package:sohoj_trip_app/representation/screen/select_date_screen.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/asset_helper.dart';
import '../widgets/item_options.dart';

class SearchTourPage extends StatefulWidget {
  const SearchTourPage({Key? key}) : super(key: key);
  static const String routeName = '/search_tour_page';

  @override
  _SearchTourPage createState() => _SearchTourPage();
}

class _SearchTourPage extends State<SearchTourPage> {
  String selectedLocation = '';
  DateTime selectedDate = DateTime.now();
  String selectedTravelType = 'Travel Alone';
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Wrap the Column with Center
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your Current Location',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  selectedLocation.isNotEmpty
                      ? selectedLocation
                      : 'Select Location',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                // 2nd Section - Search Box
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: 'Where do you want to travel?',
                //       border: InputBorder.none,
                //     ),
                //     onChanged: (value) {
                //       // Implement your search suggestion logic here
                //     },
                //   ),
                // ),
                TextField(
                  enabled: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Where do you want to travel?',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kItemPadding,
                        ),
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: kItemPadding),
                  ),
                  style: TextStyles.defaultStyle,
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),

                SizedBox(height: 30.0),

                // 3rd Section - Date Picker

                ItemOptionsWidget(
                  title: 'Select Date',
                  value: selectDate ?? 'Select date',
                  icon: AssetHelper.icoCalendal,
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (result is List<DateTime?>) {
                      setState(() {
                        selectDate =
                            '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      });
                    }
                  },
                ),

                SizedBox(height: 30.0),

                // 4th Section - Dropdown (Centered Content without Underline)
                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<String>(
                        value: selectedTravelType,
                        onChanged: (newValue) {
                          setState(() {
                            selectedTravelType = newValue!;
                          });
                        },
                        underline: Container(),
                        items: <String>['Travel Alone', 'Travel with Group']
                            .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.0),
                //5th Section - Go Button
                Center(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => MainApp()),
                    child: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
