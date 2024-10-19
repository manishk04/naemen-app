import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_enums.dart';
import '../../utils/color_constant.dart';
import '../../view_models/appointment_history_view_model.dart';
import '../../view_models/auth_view_model.dart';
import 'text_heading.dart';

class AppointmentFilter extends StatelessWidget {
  const AppointmentFilter({
    super.key,
    required this.appointmentHistoryViewModel,
    required this.authViewModel,
  });

  final AppointmentHistoryViewModel appointmentHistoryViewModel;
  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: double.infinity,
      child: Obx(
        () => ListView(
          scrollDirection: Axis.horizontal,
          children: [
            AppointmentCardWidget(
              onTap: appointmentHistoryViewModel.getIsLoading
                  ? null
                  : () => appointmentHistoryViewModel.onFilterSelect(
                      AppointmentFilterEnum.upcoming, authViewModel),
              isSelected: appointmentHistoryViewModel.getFilter ==
                  AppointmentFilterEnum.upcoming,
              title: "Upcoming",
            ),
            AppointmentCardWidget(
              onTap: appointmentHistoryViewModel.getIsLoading
                  ? null
                  : () => appointmentHistoryViewModel.onFilterSelect(
                      AppointmentFilterEnum.inProcess, authViewModel),
              isSelected: appointmentHistoryViewModel.getFilter ==
                  AppointmentFilterEnum.inProcess,
              title: "In-Process",
            ),
            AppointmentCardWidget(
              onTap: appointmentHistoryViewModel.getIsLoading
                  ? null
                  : () => appointmentHistoryViewModel.onFilterSelect(
                      AppointmentFilterEnum.completed, authViewModel),
              isSelected: appointmentHistoryViewModel.getFilter ==
                  AppointmentFilterEnum.completed,
              title: "Completed",
            ),
            AppointmentCardWidget(
              onTap: appointmentHistoryViewModel.getIsLoading
                  ? null
                  : () => appointmentHistoryViewModel.onFilterSelect(
                      AppointmentFilterEnum.cancelled, authViewModel),
              isSelected: appointmentHistoryViewModel.getFilter ==
                  AppointmentFilterEnum.cancelled,
              title: "Cancelled",
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.title,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      width: 140.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color:
              isSelected ? AppColors.primaryColor : AppColors.searchFieldsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: isSelected
                ? BorderSide.none
                : const BorderSide(
                    color: AppColors.signUpColor,
                    width: 1.0,
                  ),
          ),
          elevation: 2,
          child: Center(
            child: TextHeading(
              title: title,
              fontweight: FontWeight.w600,
              fontsize: 12.sp,
              fontcolor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
