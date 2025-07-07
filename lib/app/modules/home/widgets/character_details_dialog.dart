import 'package:flutter/material.dart';

import '../../../shared/util/app/colors_app.dart';
import '../model/character_model.dart';

class CharacterDetailsDialog extends StatelessWidget {
  final CharacterModel character;
  final Color statusColor;

  const CharacterDetailsDialog({
    super.key,
    required this.character,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorsApp.black2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        character.image,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: ColorsApp.green3,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                character.name,
                style: const TextStyle(
                  color: ColorsApp.green3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    character.status,
                    style: TextStyle(
                      color: ColorsApp.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 110,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 6,
                  radius: const Radius.circular(8),
                  interactive: true,
                  scrollbarOrientation: ScrollbarOrientation.right,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoText(
                          'ID',
                          character.id.toString(),
                          statusColor,
                        ),
                        _infoText(
                          'Espécie',
                          character.species,
                          statusColor,
                        ),
                        _infoText(
                          'Tipo',
                          character.type,
                          statusColor,
                        ),
                        _infoText(
                          'Gênero',
                          character.gender,
                          statusColor,
                        ),
                        _infoText(
                          'Origem',
                          character.origin,
                          statusColor,
                        ),
                        _infoText(
                          'Localização',
                          character.location,
                          statusColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoText(
    String label,
    String value,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: value.isNotEmpty ? value : '-',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
