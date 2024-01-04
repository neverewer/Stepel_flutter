import 'package:stepel_flutter/feature/home/presentation/bloc/home_cubit.dart';
import 'package:stepel_flutter/feature/home/home_page_form.dart';
import 'package:stepel_flutter/imports.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        fitDataRepo: DependenciesScope.of(context).fitDataRepository,
        profileDataRepo: DependenciesScope.of(context).profileDataRepository,
      )..init(),
      child: const HomePageForm(),
    );
  }
}
