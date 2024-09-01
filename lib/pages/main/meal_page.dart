import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF2F4F6),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            MealCard(),
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatefulWidget {
  const MealCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  String selectedMeal = '중식';
  int mealIndex = 1;
  
  DateTime _selectedDay = DateTime.now();

  void _presentDatePicker(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent, 
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, 
          maxChildSize: 1.0, 
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), 
                  topRight: Radius.circular(20.0),
                ),
              ),
            child: TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime(DateTime.now().year - 1),
              lastDay: DateTime(DateTime.now().year + 1),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
                Navigator.pop(context);
              },
              locale: 'ko-KR',
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard',
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard',
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF03AA71),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pretendard',
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ));
          },
        );
      }
  );
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    '급식',
                    style: TextStyle(
                      color: Color(0xFF101012),
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: selectedMeal,
                  items: <String>['조식', '중식', '석식']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xFF8F98A8),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMeal = newValue!;
                      mealIndex = ['조식', '중식', '석식'].indexOf(newValue);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF8F98A8),
                  ),
                  underline: Container(),
                  dropdownColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                _presentDatePicker(context);
              },
              child: Text(
                DateFormat('MM월 dd일 (E) 급식', 'ko').format(_selectedDay),
                style: const TextStyle(
                  color: Color(0xFF101012),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFF0F543C),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 24.0,
                    left: screenWidth * 0.3,
                    right: screenWidth * 0.3,
                    bottom: 16.0,
                  ),
                  // child: FutureBuilder(
                  //   future: getMealData(mealIndex, _selectedDay),
                  //   builder: (BuildContext context,
                  //       AsyncSnapshot mealDataSnapshot) {
                  //     if (mealDataSnapshot.connectionState ==
                  //         ConnectionState.waiting) {
                  //       return const CircularProgressIndicator();
                  //     } else if (mealDataSnapshot.hasError) {
                  //       return const FittedBox(
                  //         fit: BoxFit.none,
                  //         child: Text(
                  //           '데이터가 없습니다',
                  //           // ignore: deprecated_member_use
                  //           textScaleFactor: 1.3,
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontFamily: 'Pretendard',
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       List<String> dishNames =
                  //           mealDataSnapshot.data['dishName'];
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: dishNames
                  //           .map((menu) => Padding(
                  //             padding: const EdgeInsets.only(bottom: 15.0),
                  //             child: FittedBox(
                  //               fit: BoxFit.none,
                  //               child: Text(
                  //                 menu,
                  //                 // ignore: deprecated_member_use
                  //                 textScaleFactor: 1.3,
                  //                 style: const TextStyle(
                  //                   color: Colors.black,
                  //                   fontFamily: 'Pretendard',
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ),
                  //         )).toList(),
                  //       );
                  //     }
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}