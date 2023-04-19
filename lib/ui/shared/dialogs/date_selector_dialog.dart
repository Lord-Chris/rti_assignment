import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/_core.dart';
import '../components/_components.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';
import '../constants/spacing.dart';

export '../../../core/_core.dart';

class DateSelectorDialog extends HookWidget {
  final DateTime? startDate;
  final DateTime? currentDate;
  final bool isStart;

  const DateSelectorDialog({
    super.key,
    this.startDate,
    this.currentDate,
    required this.isStart,
  });

  DateTime get nextMonday {
    int daysUntilMonday = 8 - DateTime.now().weekday;
    return DateTime.now().add(Duration(days: daysUntilMonday));
  }

  DateTime get nextTuesday {
    return DateTime.now()
        .add(Duration(days: (DateTime.tuesday - DateTime.now().weekday) % 7));
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate =
        useState<DateTime?>(currentDate ?? (isStart ? DateTime.now() : null));
    return Dialog(
      child: Material(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: REdgeInsets.fromLTRB(16, 24, 16, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isStart)
                    Row(
                      children: [
                        Expanded(
                          child: _ButtonItem(
                            label: 'No date',
                            value: null,
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                        Spacing.horizRegular(),
                        Expanded(
                          child: _ButtonItem(
                            label: 'Today',
                            value: DateTime.now(),
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                      ],
                    ),
                  if (isStart)
                    Row(
                      children: [
                        Expanded(
                          child: _ButtonItem(
                            label: 'Today',
                            value: DateTime.now(),
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                        Spacing.horizRegular(),
                        Expanded(
                          child: _ButtonItem(
                            label: 'Next Monday',
                            value: nextMonday,
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                      ],
                    ),
                  if (isStart) Spacing.vertRegular(),
                  if (isStart)
                    Row(
                      children: [
                        Expanded(
                          child: _ButtonItem(
                            label: 'Next Tuesday',
                            value: nextTuesday,
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                        Spacing.horizRegular(),
                        Expanded(
                          child: _ButtonItem(
                            label: 'After 1 week',
                            value: DateTime.now().add(const Duration(days: 7)),
                            groupValue: selectedDate.value,
                            onTap: (day) => selectedDate.value = day,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            CalendarDatePicker2(
              value: [selectedDate.value],
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                currentDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2026),
                centerAlignModePicker: true,
                disableModePicker: true,
                selectableDayPredicate: (day) {
                  return isStart || (startDate?.isBefore(day) ?? true);
                },
                weekdayLabels: [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat'
                ],
                controlsTextStyle: AppTextStyles.medium18,
                weekdayLabelTextStyle: AppTextStyles.regular15,
                dayTextStyle: AppTextStyles.regular15,
                dayBuilder: (
                    {required DateTime date,
                    decoration,
                    isDisabled,
                    isSelected,
                    isToday,
                    textStyle}) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ?? false ? AppColors.blue : null,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: AppTextStyles.regular15.copyWith(
                        color: isDisabled ?? false
                            ? AppColors.borderGrey
                            : isSelected ?? false
                                ? AppColors.white
                                : isToday ?? false
                                    ? AppColors.blue
                                    : null,
                      ),
                    ),
                  );
                },
                nextMonthIcon: const _NextLastIcon(isNext: true),
                lastMonthIcon: const _NextLastIcon(isNext: false),
              ),
              onValueChanged: (val) {
                selectedDate.value = val.first;
              },
            ),
            Spacing.vertSmall(),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.event),
                  Spacing.horizSmall(),
                  Expanded(
                    child: Text(
                      selectedDate.value == null
                          ? 'No date'
                          : selectedDate.value!.compareExactDay(DateTime.now())
                              ? 'Today'
                              : DateFormat('d MMM yyyy')
                                  .format(selectedDate.value!),
                      style: AppTextStyles.regular16,
                    ),
                  ),
                  AppButton(
                    label: 'Cancel',
                    isCollapsed: true,
                    height: 40.h,
                    width: 73.w,
                    padding: EdgeInsets.zero,
                    buttonColor: AppColors.lightBlue,
                    labelColor: AppColors.blue,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacing.horizSmall(),
                  AppButton(
                    label: 'Save',
                    isCollapsed: true,
                    height: 40.h,
                    width: 73.w,
                    padding: EdgeInsets.zero,
                    onTap: () {
                      if (isStart) {
                        Navigator.pop(context, selectedDate.value);
                      } else {
                        Navigator.pop(context, selectedDate.value ?? startDate);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextLastIcon extends StatelessWidget {
  final bool isNext;
  const _NextLastIcon({
    Key? key,
    required this.isNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Icon(
        isNext ? Icons.arrow_right_rounded : Icons.arrow_left_rounded,
        color: AppColors.hintGrey,
        size: 35.r,
      ),
    );
  }
}

class _ButtonItem extends StatelessWidget {
  final String label;
  final DateTime? groupValue;
  final DateTime? value;
  final void Function(DateTime?) onTap;
  const _ButtonItem({
    Key? key,
    required this.label,
    this.groupValue,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  bool get isSelected => value?.day == groupValue?.day;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      padding: EdgeInsets.zero,
      label: label,
      height: 36.h,
      showFeedback: false,
      buttonColor: isSelected ? AppColors.blue : AppColors.lightBlue,
      labelColor: isSelected ? AppColors.white : AppColors.blue,
      fontWeight: FontWeight.normal,
      onTap: () => onTap(value),
    );
  }
}
