import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/routes_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/custom_svg_picture.dart';
import 'package:socially_app/features/home/domain/entity/post.dart';

class ButtonsPost extends StatefulWidget {
  const ButtonsPost({super.key, required this.post});

  final PostModel post;

  @override
  State<ButtonsPost> createState() => _ButtonsPostState();
}

class _ButtonsPostState extends State<ButtonsPost> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.post.isLiked = !widget.post.isLiked;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSvgPicture(
                assetName: AssetsManager.icLove,
                color: widget.post.isLiked ? Colors.red : colorSecondary.withOpacity(0.6),
                height: AppSize.s20,
                width: AppSize.s20,
              ).marginOnly(end: AppPadding.p8),
              Text(
                widget.post.numberOfLikes.toString(),
                style: StyleManager.getMediumStyle(
                  color: widget.post.isLiked ? Colors.red : colorSecondary.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ).marginOnly(end: AppPadding.p16),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.commentsRoute);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSvgPicture(
                assetName: AssetsManager.icComment,
                color: colorSecondary.withOpacity(0.6),
                height: AppSize.s20,
                width: AppSize.s20,
              ).marginOnly(end: AppPadding.p4),
              Text(
                widget.post.numberOfComments.toString(),
                style: StyleManager.getMediumStyle(
                  color: colorSecondary.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            setState(() {
              widget.post.isSaved = !widget.post.isSaved;
            });
          },
          child: CustomSvgPicture(
            assetName: AssetsManager.icSave,
            color: widget.post.isSaved ? Colors.lightGreen : colorSecondary.withOpacity(0.6),
            height: AppSize.s24,
            width: AppSize.s24,
          ),
        ),
      ],
    );
  }
}
