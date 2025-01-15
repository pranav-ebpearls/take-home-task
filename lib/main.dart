import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:take_home_task/config/theme/app_theme.dart';
import 'package:take_home_task/features/event/create_event.dart';
import 'package:take_home_task/shared_widgets/calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

final taskTheme = appTheme();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveSizer(
      designSize: Size(375, 812),
      builder: (context) => MaterialApp(
        theme: taskTheme,
        debugShowCheckedModeBanner: false,
        home: CreateEvent(),
        // home: Calendar(),
      ),
    );
  }
}
