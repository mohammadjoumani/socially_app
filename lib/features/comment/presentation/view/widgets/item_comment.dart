import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/custom_svg_picture.dart';
import 'package:socially_app/core/utils/widgets/image_network_widget.dart';
import 'package:socially_app/core/utils/widgets/margin.dart';
import 'package:socially_app/features/comment/domain/entity/comment.dart';

import 'item_reply_comment.dart';

class ItemComment extends StatefulWidget {
  const ItemComment({super.key, required this.comment});

  final Comment comment;

  @override
  State<ItemComment> createState() => _ItemCommentState();
}

class _ItemCommentState extends State<ItemComment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNetworkWidget(
              imageUrl: widget.comment.user.image,
              imageSize: AppSize.s28,
              imageRadius: AppSize.s48,
            ),
            const Sw2(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.comment.user.username,
                    style: StyleManager.getSemiBoldStyle(
                      color: colorOnBackgroundCard,
                    ),
                  ).marginOnly(bottom: AppPadding.p4),

                  //Content comment
                  Text(
                    widget.comment.contentComment,
                    style: StyleManager.getMediumStyle(
                      color: colorOnBackgroundCard,
                    ),
                  ).marginOnly(bottom: AppPadding.p4),

                  // Reply button
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        AppStrings.strReply.tr(context),
                        style: StyleManager.getMediumStyle(
                          color: colorSecondary.withOpacity(0.6),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Sw2(),
            // Like button
            InkWell(
              onTap: () => _onPressedLikeButton(),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    CustomSvgPicture(
                      assetName: AssetsManager.icLove,
                      color: widget.comment.isLiked ? Colors.red : colorSecondary,
                      height: AppSize.s14,
                      width: AppSize.s14,
                    ),
                    Text(
                      widget.comment.numberOfLikes.toString(),
                      style: StyleManager.getMediumStyle(
                        color: widget.comment.isLiked ? Colors.red : colorSecondary.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: widget.comment.replies.isNotEmpty && !widget.comment.isVisibleReplies,
          child: InkWell(
            onTap: () {
              setState(() {
                widget.comment.isVisibleReplies = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                AppStrings.strSeeReliesComment.tr(context),
                style: StyleManager.getMediumStyle(
                  color: colorSecondary.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
        if (widget.comment.isVisibleReplies) ...{
          const Sh2(),
          for (final replyComment in widget.comment.replies) ItemReplyComment(replyComment: replyComment).marginOnly(bottom: AppPadding.p4),
        }
      ],
    );
  }

  _onPressedLikeButton() {
    setState(() {
      widget.comment.isLiked = !widget.comment.isLiked;
    });
  }
}
