import 'package:flutter/material.dart';

import '../../../shared/util/app/colors_app.dart';

class CharacterCard extends StatelessWidget {
  final String name;
  final String status;
  final String imageUrl;

  const CharacterCard({
    super.key,
    required this.name,
    required this.status,
    required this.imageUrl,
  });

  Color get statusColor {
    final s = status.toLowerCase();
    if (s == 'alive') return ColorsApp.green3;
    if (s == 'dead') return ColorsApp.red;
    return ColorsApp.orange;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        // Ajusta o tamanho da fonte baseado no tamanho do card
        final fontSize = cardWidth > 200 ? 14.0 : cardWidth * 0.08;
        return Container(
          decoration: BoxDecoration(
            color: ColorsApp.black2,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: cardWidth * 0.99,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: ColorsApp.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: fontSize * 0.7,
                      height: fontSize * 0.7,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: fontSize * 0.4),
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                        fontSize: fontSize * 0.9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
