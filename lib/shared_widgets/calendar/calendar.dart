import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:take_home_task/utils/constants/colors.dart';
import 'package:take_home_task/utils/constants/strings.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day; // Ensure `today` matches the selected day
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: AppStrings.calendarLanguage,
      rowHeight: AppStrings.calendarRowHeight,
      daysOfWeekVisible: false,
      headerStyle: HeaderStyle(
        titleCentered: false, // Align the title to the left
        formatButtonVisible: false, // Hide the format button
        leftChevronVisible: false, // Hide default left chevron
        rightChevronVisible: false, // Hide default right chevron
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      focusedDay: today, // Set the initially focused day to today
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: _onDaySelected,
      firstDay: DateTime(2000, 01, 01),
      lastDay: DateTime(2100, 01, 01),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendTextStyle: TextStyle(color: Colors.white),
        selectedDecoration: BoxDecoration(
          color: AppColors.secondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      onPageChanged: (focusedDay) {
        setState(() {
          // Update the month focus without changing the selected day
          today = today.isSameDate(focusedDay) ? today : focusedDay;
        });
      },
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          String monthYear =
              DateFormat('MMMM yyyy').format(day); // Format month and year
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                monthYear, // Display formatted month and year
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        today = DateTime(
                          today.year,
                          today.month - 1,
                          today.day,
                        ); // Navigate to the previous month
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        today = DateTime(
                          today.year,
                          today.month + 1,
                          today.day,
                        ); // Navigate to the next month
                      });
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
