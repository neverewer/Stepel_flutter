import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_cubit.dart';
import 'package:stepel_flutter/feature/widgets/app_bar_actions.dart';
import 'package:stepel_flutter/feature/widgets/page_title.dart';

class JournalAppBar extends StatelessWidget {
  const JournalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
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
          titlePadding: EdgeInsets.only(left: 16, top: topPadding),
          expandedTitleScale: 2,
          title: Align(
            alignment: isOnTop ? Alignment.centerLeft : Alignment.bottomLeft,
            child: PageTitle(text: context.localization.journalPageTitle),
          ));
    });
  }
}
