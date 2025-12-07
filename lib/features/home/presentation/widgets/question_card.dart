import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/models/question_model.dart';
import '../../../../core/constants/helper_constants.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final bool hasImage = question.imageUri.isNotEmpty;

    return Container(
      width: HelperConstants.homeHorizontalCardWidth,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: hasImage
                ? CachedNetworkImage(
                    imageUrl: question.imageUri,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey.shade300),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.error),
                    ),
                  )
                : Container(color: Colors.grey.shade300),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
