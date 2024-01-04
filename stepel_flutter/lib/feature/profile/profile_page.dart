import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_cubit.dart';
import 'package:stepel_flutter/feature/profile/profile_page_form.dart';
import 'package:stepel_flutter/imports.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(profileDataRepo: DependenciesScope.of(context).profileDataRepository)..init(),
      child: const ProfilePageForm(),
    );
  }
}
