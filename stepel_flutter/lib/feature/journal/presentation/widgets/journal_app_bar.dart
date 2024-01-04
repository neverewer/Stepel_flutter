import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_cubit.dart';
import 'package:stepel_flutter/imports.dart';

class JournalAppBar extends StatelessWidget {
  const JournalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: Sizes.appBarExpendedHeight,
      pinned: true,
      actions: [
        AppBarActions(
          icon: Icons.autorenew_rounded,
          iconCallBack: () => context.read<JournalCubit>().loadData(),
        )
      ],
      flexibleSpace: const JournalAppBarFlexibleSpace(),
    );
  }
}

class JournalAppBarFlexibleSpace extends StatelessWidget {
  const JournalAppBarFlexibleSpace({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = context.safeArea.top;
    final double collapsedHeight = topPadding + kToolbarHeight;
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      final double appBarHeight = constraints.maxHeight;
      final isOnTop = appBarHeight <= collapsedHeight;
      return FlexibleSpaceBar(
          centerTitle: isOnTop,
          titlePadding: EdgeInsets.only(left: Sizes.spacingFull, top: topPadding),
          expandedTitleScale: Sizes.appBarExpandedTitleScaleFactor,
          title: Align(
            alignment: isOnTop ? Alignment.centerLeft : Alignment.bottomLeft,
            child: PageTitle(text: context.localization.journalPageTitle),
          ));
    });
  }
}
