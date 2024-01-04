import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_state.dart';
import 'package:stepel_flutter/feature/profile/presentation/widgets/profile_data_widget.dart';
import 'package:stepel_flutter/feature/widgets/loading_widget.dart';

class ProfilePageForm extends StatelessWidget {
  const ProfilePageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => state.map(
        idle: (_) => const LoadingWidget(),
        processing: (_) => const LoadingWidget(),
        successful: (state) => ProfileDataWidget(
          stepsTarget: state.stepsTarget,
          cardioPointsTarget: state.cardioPointsTarget,
          isSleepingModeActive: state.isSleepingModeActive,
          wakeUpTime: state.wakeUpTime,
          timeToSleep: state.timeToSleep,
        ),
        error: (_) => const SizedBox(),
      ),
    );
  }
}
