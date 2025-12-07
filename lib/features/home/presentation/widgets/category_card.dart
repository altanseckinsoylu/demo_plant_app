import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool hasImage =
        category.image?.url != null && category.image!.url.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Text(
              category.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (hasImage)
            Positioned(
              height: MediaQuery.of(context).size.height * 0.2,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: category.image!.url,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.grey),
                  placeholder: (context, url) =>
                      Container(color: Colors.grey.shade100),
                ),
              ),
            )
          else
            Positioned(
              right: 12,
              bottom: 12,
              child: Icon(
                Icons.image_not_supported,
                color: Colors.grey.shade300,
                size: 40,
              ),
            ),
        ],
      ),
    );
  }
}
