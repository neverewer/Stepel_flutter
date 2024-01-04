import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/profile_page_form.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(profileDataRepository: DependenciesScope.of(context).profileDataRepository)..init(),
      child: const ProfilePageForm(),
    );
  }
}
