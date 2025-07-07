import 'package:flutter/material.dart';

import '../../util/app/colors_app.dart';
import '../../util/app/imgs_app.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Image(
        image: AssetImage(ImgsApp.logo),
        width: 140,
      ),
      iconTheme: const IconThemeData(
        color: ColorsApp.green,
        size: 35.0,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: ColorsApp.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              offset: Offset(0, 6), // Posição da sombra
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
