import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';

Future<TimeOfDay?> showCustomTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
}) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime,
    initialEntryMode: TimePickerEntryMode.input,
    helpText: context.localization.profilePageTimePickerLabel,
    hourLabelText: context.localization.profilePageTimePickerHourLabelText,
    minuteLabelText: context.localization.profilePageTimePickerMinuteLabelText,
    cancelText: context.localization.pickerCancelButtonText,
    confirmText: context.localization.pickerOkButton,
  );
}
