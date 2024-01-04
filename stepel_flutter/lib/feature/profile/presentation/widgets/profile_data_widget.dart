import 'package:stepel_flutter/feature/dialogs/number_picker_dialog.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_app_bar.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_info_box.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_section_label.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_section_label_switchable.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/sleep_mode_section.dart';
import 'package:stepel_flutter/imports.dart';

class ProfileDataWidget extends StatelessWidget {
  final int stepsTarget;
  final int cardioPointsTarget;
  final bool isSleepingModeActive;
  final TimeOfDay wakeUpTime;
  final TimeOfDay timeToSleep;

  const ProfileDataWidget({
    super.key,
    required this.stepsTarget,
    required this.cardioPointsTarget,
    required this.isSleepingModeActive,
    required this.wakeUpTime,
    required this.timeToSleep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileAppBar(),
        const SizedBox(
          height: 20,
        ),
        ProfileSectionLabel(text: context.localization.profilePageActivityGoalsSectionText),
        const SizedBox(height: 10),
        const Divider(thickness: 1.5),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoBox(
                label: context.localization.profilePageStepsTargetInfoBoxLabel,
                value: stepsTarget.toString(),
                onTap: () async {
                  int? result = await showNumberPickerDialog(
                    context: context,
                    title: context.localization.profilePageStepsTargetInfoBoxLabel,
                    currentValue: stepsTarget,
                    minValue: 500,
                    maxValue: 100000,
                    step: 500,
                  );
                  if (result != null && context.mounted) {
                    context.read<ProfileCubit>().setStepsTarget(result);
                  }
                }),
            InfoBox(
              label: context.localization.profilePageCardioPointsTargetInfoBoxLabel,
              value: cardioPointsTarget.toString(),
              onTap: () async {
                int? result = await showNumberPickerDialog(
                  context: context,
                  title: context.localization.profilePageCardioPointsTargetInfoBoxLabel,
                  currentValue: cardioPointsTarget,
                  minValue: 5,
                  maxValue: 200,
                  step: 5,
                );
                if (result != null && context.mounted) {
                  context.read<ProfileCubit>().setCardioPointsTarget(result);
                }
              },
            )
          ],
        ),
        const SizedBox(height: 20),
        ProfileSectionLabelSwitchable(
          text: context.localization.profilePageBedtimeScheduleSectionText,
          value: isSleepingModeActive,
        ),
        const Divider(thickness: 1.5),
        const SizedBox(height: 15),
        SleepModeSection(
          isActive: isSleepingModeActive,
          timeToSleep: timeToSleep,
          wakeUpTime: wakeUpTime,
        ),
      ],
    );
  }
}
