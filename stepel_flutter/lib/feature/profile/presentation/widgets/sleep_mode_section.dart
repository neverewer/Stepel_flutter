import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/dialogs/custom_time_picker_dialog.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_info_box.dart';

class SleepModeSection extends StatelessWidget {
  final bool isActive;
  final TimeOfDay wakeUpTime;
  final TimeOfDay timeToSleep;

  const SleepModeSection({
    super.key,
    required this.isActive,
    required this.wakeUpTime,
    required this.timeToSleep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoBox(
          isActive: isActive,
          label: context.localization.profilePageGetInBedInfoBoxLabel,
          value: timeToSleep.format(context),
          onTap: () async {
            var pickedTime = await showCustomTimePicker(context: context, initialTime: timeToSleep);
            if (pickedTime != null && context.mounted) {
              context.read<ProfileCubit>().setTimeToSleep(pickedTime);
            }
          },
        ),
        InfoBox(
          isActive: isActive,
          label: context.localization.profilePageWakeUpInfoBoxLabel,
          value: wakeUpTime.format(context),
          onTap: () async {
            var pickedTime = await showCustomTimePicker(context: context, initialTime: wakeUpTime);
            if (pickedTime != null && context.mounted) {
              context.read<ProfileCubit>().setWakeUpTime(pickedTime);
            }
          },
        ),
      ],
    );
  }
}
