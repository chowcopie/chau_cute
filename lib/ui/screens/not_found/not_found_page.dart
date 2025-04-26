import 'package:flutter/material.dart';

import 'package:demo_structure/ui/widgets/my_app_bar.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: '404 page '),
      backgroundColor: Colors.white,
    );
  }
}
