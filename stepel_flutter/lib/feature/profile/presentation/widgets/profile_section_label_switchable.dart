import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_section_label.dart';
import 'package:stepel_flutter/imports.dart';

class ProfileSectionLabelSwitchable extends StatefulWidget {
  final String text;
  final bool value;

  const ProfileSectionLabelSwitchable({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  State<ProfileSectionLabelSwitchable> createState() => _ProfileSectionLabelSwitchableState();
}

class _ProfileSectionLabelSwitchableState extends State<ProfileSectionLabelSwitchable> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.spacingFull),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileSectionLabel(
            text: widget.text,
          ),
          Switch(
            value: isSwitched,
            onChanged: (onChanged) {
              setState(
                () {
                  isSwitched = !isSwitched;
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.read<ProfileCubit>().activeDailySleepingModeNotifications(isSwitched);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
