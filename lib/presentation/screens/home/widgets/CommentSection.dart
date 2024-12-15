import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/theme/theme_colors.dart';
import 'package:time_tracking_app_new/data/model/task/comment_res.dart';

import '../../../../core/constants/string_constants.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.comments,
  });

  final List<CommentRes> comments;

  @override
  Widget build(BuildContext context) {
    ThemeColors.updateColors(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.comments,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ThemeColors.textColor),
          ),
          ...List.generate(
            comments.length,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                comments[index].content ?? "",
                style: TextStyle(color: ThemeColors.textColor),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
