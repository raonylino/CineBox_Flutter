import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widget/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  final MovieDetail movieDetail;
  const CastBox({super.key, required this.movieDetail});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        dense: true,
        tilePadding: const EdgeInsets.only(left: 0, right: 0),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),
        title: const Text(
          'Elenco',
          style: AppTextStyles.regularSmall,
        ),
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieDetail.cast.length,
              itemBuilder: (context, index) {
                final cast = movieDetail.cast[index];
                return ActorCard(
                  name: cast.name,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${cast.profilePath}',
                  character: cast.character,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
