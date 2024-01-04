import 'package:flutter/material.dart';
import 'package:stepel_flutter/feature/settings/presentation/widgets/settings_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
