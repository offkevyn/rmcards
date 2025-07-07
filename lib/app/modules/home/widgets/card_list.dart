import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/util/app/colors_app.dart';
import '../bloc/character/character_bloc.dart';
import '../bloc/character/character_event.dart';
import '../bloc/character/character_state.dart';
import 'character_card.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late final CharacterBloc characterBloc;

  @override
  void initState() {
    super.initState();
    characterBloc = Modular.get<CharacterBloc>();
    characterBloc.add(LoadCharactersEvent(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      bloc: characterBloc,
      builder: (context, state) {
        if (state is CharacterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CharacterErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                color: ColorsApp.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
        if (state is CharactersLoadedState) {
          if (state.characters.isEmpty) {
            return const Center(
              child: Text(
                'No characters found',
                style: TextStyle(
                  color: ColorsApp.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              int crossAxisCount = 2;
              double aspectRatio = 0.65;
              if (width > 2560) {
                crossAxisCount = 7;
                aspectRatio = 0.9;
              } else if (width > 2200) {
                crossAxisCount = 6;
                aspectRatio = 0.88;
              } else if (width > 1800) {
                crossAxisCount = 5;
                aspectRatio = 0.85;
              } else if (width > 1400) {
                crossAxisCount = 4;
                aspectRatio = 0.82;
              } else if (width > 900) {
                crossAxisCount = 3;
                aspectRatio = 0.7;
              } else if (width > 600) {
                crossAxisCount = 2;
                aspectRatio = 0.68;
              }
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: aspectRatio,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 20,
                ),
                itemCount: state.characters.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final character = state.characters[index];
                  return CharacterCard(
                    name: character.name,
                    status: character.status,
                    imageUrl: character.image,
                  );
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
