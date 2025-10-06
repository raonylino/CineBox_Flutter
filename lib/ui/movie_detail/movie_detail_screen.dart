import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_message.dart';
import 'package:cinebox/ui/movie_detail/commands/get_movie_detail_command.dart';
import 'package:cinebox/ui/movie_detail/movie_detail_view_model.dart';
import 'package:cinebox/ui/movie_detail/widget/cast_box.dart';
import 'package:cinebox/ui/movie_detail/widget/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/widget/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int;
      ref.read(movieDetailViewModelProvider).fetchMovieDetail(movieId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetal = ref.watch(getMovieDetailCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: movieDetal.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Ocorreu um erro ao buscar detalhes do filme')),
        data: (data) {
          if (data == null) {
            return const Center(child: Text('Nenhum filme'));
          }
          final hoursRuntime = data.runtime ~/ 60;
          final minutesRuntime = data.runtime % 60;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.images.length,
                    itemBuilder: (context, index) {
                      final img = data.images[index];
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          imageUrl: img,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 160,
                            color: AppColors.lightGrey,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        value: data.voteAverage / 2,
                        starSize: 14,
                        valueLabelVisibility: false,
                        starColor: AppColors.yellow,
                      ),
                      Text(
                        data.genres.map((e) => e.name).join(', '),
                        style: AppTextStyles.lightGreyRegular,
                      ),

                      Text(
                        '${DateTime.parse(data.releaseDate).year}  | $hoursRuntime h $minutesRuntime min',
                        style: AppTextStyles.lightGreySmall,
                      ),

                      Text(
                        data.overview,
                        style: AppTextStyles.regularSmall,
                      ),
                      CastBox(movieDetail: data),
                      if (data.videos.isNotEmpty)
                        MovieTrailer(videoId: data.videos.first),
                      const SizedBox(
                        height: 30,
                      ),
                      RatingPanel(
                        voteAverage: data.voteAverage,
                        voteCount: data.voteCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
