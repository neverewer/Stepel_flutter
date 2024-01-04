import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/feature/home/presentation/bloc/home_cubit.dart';
import 'package:stepel_flutter/feature/home/presentation/bloc/home_state.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/home_data_widget.dart';
import 'package:stepel_flutter/feature/widgets/loading_widget.dart';

class HomePageForm extends StatelessWidget {
  const HomePageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => state.map(
            idle: (_) => const LoadingWidget(),
            processing: (_) => const LoadingWidget(),
            successful: (state) => HomeDataWidget(
                  fitData: state.fitData,
                  stepsTarget: state.stepsTarget,
                  cardioPointsTarget: state.cardioPointsTarget,
                  weeklyFitData: state.weeklyFitData,
                ),
            error: (_) => const SizedBox()));
  }
}
