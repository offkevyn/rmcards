import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/util/app/colors_app.dart';
import '../../../shared/widgets/app_bar/app_bar_custom.dart';
import '../../../shared/widgets/app_bar/drawer_custom.dart';
import '../../../shared/widgets/button_custom/button_custom.dart';
import '../../../shared/widgets/input_custom/input_custom.dart';
import '../bloc/character/character_bloc.dart';
import '../bloc/character/character_event.dart';
import '../bloc/character/character_state.dart';
import '../widgets/card_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CharacterBloc characterBloc;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    characterBloc = Modular.get<CharacterBloc>();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();

    if (value.length >= 3) {
      _debounceTimer = Timer(const Duration(milliseconds: 1500), () {
        characterBloc.add(SearchCharactersEvent(search: value));
      });
    } else if (value.isEmpty) {
      _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
        characterBloc.add(SearchCharactersEvent(search: null));
      });
    }
  }

  void _onScroll() {
    if (!scrollController.hasClients || _isLoading) return;

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;

    if (currentScroll >= maxScroll - 500 &&
        !characterBloc.hasReachedMax &&
        characterBloc.state is CharactersLoadedState) {
      _isLoading = true;
      characterBloc.add(LoadCharactersEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const DrawerCustom(),
      backgroundColor: ColorsApp.black,
      body: BlocListener<CharacterBloc, CharacterState>(
        bloc: characterBloc,
        listener: (context, state) {
          if (state is CharactersLoadedState || state is CharacterErrorState) {
            _isLoading = false;
          }
        },
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(ColorsApp.green4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(16),
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
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
                        controller: searchController,
                        placeholder: 'Pesquisar personagem',
                        icon: Icons.search,
                        onChanged: _onSearchChanged,
                        iconAtEnd: false,
                      ),
                      const SizedBox(height: 32),
                      CardList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
