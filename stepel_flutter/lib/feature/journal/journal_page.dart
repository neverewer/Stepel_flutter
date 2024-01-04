import 'package:stepel_flutter/feature/journal/journal_page_form.dart';
import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_cubit.dart';
import 'package:stepel_flutter/imports.dart';

@RoutePage()
class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalCubit(
          fitDataRepository: DependenciesScope.of(context).fitDataRepository,
          profileDataRepository: DependenciesScope.of(context).profileDataRepository)
        ..loadData(),
      child: const JournalPageForm(),
    );
  }
}
