import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String character;

  const ActorCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              padding: EdgeInsets.all(30),
              width: 85,
              height: 85,
              color: AppColors.lightGrey,
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(R.ASSETS_IMAGES_NO_IMAGE_PNG),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            imageBuilder: (context, imageProvider) => Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.boldSmall.copyWith(fontSize: 12),
          ),
          Text(
            character,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.lightGreySmall,
          ),
        ],
      ),
    );
  }
}
