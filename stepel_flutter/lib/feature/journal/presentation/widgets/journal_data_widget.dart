import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/domain/entites/fit_data_entity.dart';
import 'package:stepel_flutter/feature/journal/presentation/widgets/journal_app_bar.dart';
import 'package:stepel_flutter/feature/journal/presentation/widgets/journal_list_item.dart';

class JournalDataWidget extends StatelessWidget {
  final List<FitDataEntity> data;

  const JournalDataWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [const JournalAppBar()],
      body: data.isEmpty
          ? const Center(
              child: Text(
                'Journal is empty',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (_, index) => JournalListItem(fitData: data[index]),
              separatorBuilder: (_, index) => const SizedBox(
                height: 5,
              ),
            ),
    );
  }
}
