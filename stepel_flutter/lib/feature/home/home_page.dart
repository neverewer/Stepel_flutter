import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';
import 'package:stepel_flutter/feature/home/presentation/bloc/home_cubit.dart';
import 'package:stepel_flutter/feature/home/home_page_form.dart';

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
