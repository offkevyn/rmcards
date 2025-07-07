import 'package:flutter/material.dart';

import '../../../shared/util/app/colors_app.dart';
import '../../../shared/widgets/app_bar/app_bar_custom.dart';
import '../../../shared/widgets/app_bar/drawer_custom.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      drawer: DrawerCustom(),
      backgroundColor: ColorsApp.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
