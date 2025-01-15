import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:take_home_task/shared_widgets/calendar/calendar.dart';
import 'package:take_home_task/shared_widgets/custom_dropdown/custom_dropdown.dart';
import 'package:take_home_task/shared_widgets/custom_textfield.dart';
import 'package:take_home_task/utils/constants/colors.dart';
import 'package:take_home_task/utils/constants/strings.dart';

List<String> days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  dispalyDays() {
    for (int i = 0; i < days.length; i++) {
      Text(days[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(AppStrings.createEvent,
            style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                AppStrings.virtualLink,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 12),
              Text(
                AppStrings.virtualLinkBody,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                controller: controller,
                labelText: AppStrings.virtualLinkHint,
              ),
              SizedBox(height: 24),
              Divider(color: AppColors.dividerColor),
              SizedBox(height: 24),
              Text(
                AppStrings.dateAndTimeTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 28),
              Text(
                AppStrings.dateAndTimeBody,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 30,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.0127),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Text(days[index]),
                    itemCount: days.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: AppColors.dividerColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Calendar(),
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.startTimeText,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 8),
                      CustomDropdown(text: '10:00am'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
