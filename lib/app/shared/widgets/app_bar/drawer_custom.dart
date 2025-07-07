import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../util/app/colors_app.dart';
import '../../util/app/imgs_app.dart';
import '../../util/app/routes_app.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  late List<_ItemDrawer> listItens;

  @override
  void initState() {
    listItens = [
      _ItemDrawer(
        name: 'Home',
        icon: const Icon(
          Icons.home_outlined,
          color: ColorsApp.green2,
          size: 30,
        ),
        onTap: () {
          Modular.to.navigate(RoutesApp.Home);
        },
      ),
      _ItemDrawer(
        name: 'Sair',
        icon: const Icon(
          Icons.door_front_door_outlined,
          color: ColorsApp.green2,
          size: 30,
        ),
        onTap: () async => await _logoff(),
      ),
    ];

    super.initState();
  }

  _logoff() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorsApp.black3,
          title: const Text(
            "Sair?",
            style: TextStyle(
              color: ColorsApp.gray,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Tem certeza que quer sair?",
            style: TextStyle(
              color: ColorsApp.gray,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "NÃO",
                style: TextStyle(
                  color: ColorsApp.green2,
                ),
              ),
            ),
            // _buttonLogoutYes(),
          ],
        );
      },
    );
  }

  // Widget _buttonLogoutYes() {
  //   return TextButton(
  //     onPressed: () async {
  //       Modular.get<LogoutBloc>().add(LogoutUserEvent());
  //     },
  //     child: const Text(
  //       "SIM",
  //       style: TextStyle(
  //         color: ColorsApp.red,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsApp.black,
      width: 270,
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          const Image(
            image: AssetImage(ImgsApp.logo),
            width: 150,
          ),
          const SizedBox(height: 10),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasError) {
                return const Text('--');
              } else if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final data = snapshot.data!;
              return Text(
                'V ${data.version}',
                style: const TextStyle(
                  color: ColorsApp.green2,
                  fontSize: 14,
                ),
              );
            },
          ),
          RichText(
            text: const TextSpan(
              text: 'Desenvolvido por: ',
              style: TextStyle(
                fontSize: 12,
                color: ColorsApp.green2,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'offKevyn',
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsApp.green2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: ((context, index) {
                var itemDrawer = listItens[index];
                return ListTile(
                  minLeadingWidth: 0,
                  leading: itemDrawer.icon,
                  title: Transform.translate(
                    offset: const Offset(-10, 0),
                    child: Text(
                      itemDrawer.name,
                      style: const TextStyle(
                        color: ColorsApp.green2,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onTap: itemDrawer.onTap,
                );
              }),
              separatorBuilder: (__, _) => const Divider(
                height: 1.5,
                color: ColorsApp.gray,
              ),
              itemCount: listItens.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDrawer {
  String name;
  Widget icon;
  void Function() onTap;
  _ItemDrawer({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}
