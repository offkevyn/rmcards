import 'package:flutter/material.dart';

import '../../../shared/util/app/colors_app.dart';
import '../../../shared/widgets/app_bar/app_bar_custom.dart';
import '../../../shared/widgets/app_bar/drawer_custom.dart';
import '../../../shared/widgets/button_custom/button_custom.dart';
import '../../../shared/widgets/input_custom/input_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const DrawerCustom(),
      backgroundColor: ColorsApp.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : width * 0.15, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ButtonCustom(
                      text: 'Diário',
                      icon: Icons.calendar_today,
                      onTap: () {},
                      iconAtEnd: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ButtonCustom(
                      text: 'Favoritos',
                      icon: Icons.favorite,
                      onTap: () {},
                      iconAtEnd: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InputCustom(
                placeholder: 'Pesquisar personagem',
                icon: Icons.search,
                onChanged: (value) {},
                iconAtEnd: false,
              ),
              const SizedBox(height: 32),
              // ... outros widgets da Home
              Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
