import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_cubit.dart';
import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_state.dart';
import 'package:stepel_flutter/feature/journal/presentation/widgets/journal_data_widget.dart';
import 'package:stepel_flutter/feature/widgets/loading_widget.dart';

class JournalPageForm extends StatelessWidget {
  const JournalPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalCubit, JournalState>(
      builder: (context, state) => state.map(
        idle: (_) => const LoadingWidget(),
        processing: (_) => const LoadingWidget(),
        successful: (_) => JournalDataWidget(data: state.data),
        error: (_) => const SizedBox(),
      ),
    );
  }
}
