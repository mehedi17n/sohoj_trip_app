import 'package:flutter/material.dart';

class TourPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Plan Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TourPlanPage(),
    );
  }
}

class TourPlanPage extends StatefulWidget {
  @override
  _TourPlanPageState createState() => _TourPlanPageState();
}

class _TourPlanPageState extends State<TourPlanPage> {
  bool _showDetailsView = true;
  List<String> days = ['Day 1']; // Start with only Day 1
  String selectedDay = 'Day 1';

  void _toggleView() {
    setState(() {
      _showDetailsView = !_showDetailsView;
    });
  }

  void _addDay() {
    setState(() {
      int dayNumber = days.length + 1;
      days.add('Day $dayNumber');
      selectedDay = 'Day $dayNumber'; // Select the newly added day
    });
  }

  void _selectDay(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Plan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Tour Plan',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 170,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: _showDetailsView
                            ? Color(0x99ffffff)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _showDetailsView = true;
                          });
                        },
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: !_showDetailsView
                            ? Color(0x99ffffff)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _showDetailsView = false;
                          });
                        },
                        child: Text(
                          'Graphical',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              _showDetailsView
                  ? DetailsView(
                      days: days,
                      onAddDay: _addDay,
                      selectedDay: selectedDay,
                      onSelectDay: _selectDay,
                    )
                  : Container(), // Empty container for Day 2
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  final List<String> days;
  final VoidCallback onAddDay;
  final String selectedDay;
  final Function(String) onSelectDay;

  DetailsView(
      {required this.days,
      required this.onAddDay,
      required this.selectedDay,
      required this.onSelectDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TourPlanSection(
          days: days,
          onAddDay: onAddDay,
          selectedDay: selectedDay,
          onSelectDay: onSelectDay,
        ),
        for (String day in days)
          if (day != 'Day 1')
            EmptyDayView(
              day: day,
            ), // Add an empty view for each day except Day 1
      ],
    );
  }
}

class EmptyDayView extends StatelessWidget {
  final String day;

  EmptyDayView({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$day is empty',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}

class TourPlanSection extends StatelessWidget {
  final List<String> days;
  final VoidCallback onAddDay;
  final String selectedDay;
  final Function(String) onSelectDay;

  TourPlanSection(
      {required this.days,
      required this.onAddDay,
      required this.selectedDay,
      required this.onSelectDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tour Plan by Day',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (String day in days)
                ElevatedButton(
                  onPressed: () {
                    // Handle the action for each day button
                    onSelectDay(day);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedDay == day ? Colors.black87 : Colors.grey,
                  ),
                  child: Text(day),
                ),
              ElevatedButton(
                onPressed: onAddDay,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Colors.black87,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Icon(
                  Icons.add,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          TourActivityList(selectedDay: selectedDay),
        ],
      ),
    );
  }
}

class TourActivityList extends StatelessWidget {
  final String selectedDay;

  TourActivityList({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedDay == 'Day 1') // Render activities only for Day 1
          TourActivityItem(
            time: '5:00 AM',
            activity: 'Leave home',
          ),
        // Add more activity items as needed
      ],
    );
  }
}

class TourActivityItem extends StatelessWidget {
  final String time;
  final String activity;

  TourActivityItem({required this.time, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  activity,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            DropdownButton<String>(
              value: 'Uber', // Replace with your actual options
              onChanged: (newValue) {
                // Handle dropdown selection
              },
              items: <String>[
                'Uber',
                'Lyft',
                'Taxi',
                // Add more options as needed
              ].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            SizedBox(width: 8.0),
            Icon(
              Icons.local_taxi,
              color: Colors.black87,
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
