import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/image_network_widget.dart';
import 'package:socially_app/features/comment/domain/entity/comment.dart';

class ItemReplyComment extends StatelessWidget {
  const ItemReplyComment({super.key, required this.replyComment});

  final ReplyComment replyComment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: AppPadding.p28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetworkWidget(
            imageUrl: replyComment.user.image,
            imageSize: AppSize.s28,
            imageRadius: AppSize.s48,
          ).marginOnly(end: AppPadding.p4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  replyComment.user.username,
                  style: StyleManager.getSemiBoldStyle(
                    color: colorOnBackgroundCard,
                  ),
                ).marginOnly(bottom: AppPadding.p4),

                //Content comment
                Text(
                  replyComment.replyComment,
                  style: StyleManager.getMediumStyle(
                    color: colorOnBackgroundCard,
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
