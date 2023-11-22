import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/one_task_model.dart';
import 'package:todo_app/provider/home_provider.dart';
import 'package:todo_app/shared/remote/firebase_function.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:todo_app/views/widget/custom_elevated_button.dart';
import 'package:todo_app/views/widget/custom_textFormField.dart';
import 'package:todo_app/views/widget/date_picker_container_addTask.dart';
import 'package:todo_app/views/widget/time_picker_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateTask extends StatelessWidget {
  const UpdateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);

        return SizedBox(
          height: MediaQuery.of(context).size.height * .90.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: homeProvider.formKey,
              child: ListView(
                children: [
                  Text(
                    AppLocalizations.of(context)!.updateNewTask,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                      labelText: AppLocalizations.of(context)!.enterYourTask,
                      controller: homeProvider.taskTitleController),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.taskDetail,
                    controller: homeProvider.taskDetailController,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppLocalizations.of(context)!.selectDate,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 10.h),
                  DatePickerContainerAddTask(
                    dateText: DateFormat('dd-MMMM-yyy')
                        .format(homeProvider.selectedDate),
                    selectDate: () {
                      homeProvider.changeSelectedDate(context);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppLocalizations.of(context)!.selectTime,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 10.h),
                  TimePickerContainer(
                    timeText: homeProvider.time.format(context),
                    selectTime: () {
                      homeProvider.selectTime(context);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CustomElevatedButton(
                        buttonText: AppLocalizations.of(context)!.update,
                        buttonColor: AppColor.lightPrimaryColor,
                        buttonFunction: () {
                          if (homeProvider.formKey.currentState!.validate()) {
                            OneTaskModel taskModel = OneTaskModel(
                                title: homeProvider.taskTitleController.text,
                                details: homeProvider.taskDetailController.text,
                                date: homeProvider.selectedDate.toString(),
                                time: homeProvider.time.format(context),
                                status: false);
                            FireBaseFunction.addTaskToFireStore(taskModel);
                            Navigator.pop(context);
                          }
                        },
                      ),
                      SizedBox(width: 10.w),
                      CustomElevatedButton(
                        buttonText: AppLocalizations.of(context)!.cancel,
                        buttonColor: Colors.red,
                        buttonFunction: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
