import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/extensions.dart';
import 'package:socially_app/core/utils/extension/string_extension.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/generic_card.dart';
import 'package:socially_app/core/utils/widgets/image_network_widget.dart';
import 'package:socially_app/core/utils/widgets/margin.dart';
import 'package:socially_app/features/home/domain/entity/post.dart';
import 'package:socially_app/features/home/presentation/view/widgets/buttons_post.dart';

import 'custom_image_slider.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: GenericCard(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: AppPadding.p16,
            end: AppPadding.p16,
            top: AppPadding.p16,
            bottom: AppPadding.p4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageNetworkWidget(
                    imageUrl: post.user.image,
                    imageSize: AppSize.s38,
                    imageRadius: AppSize.s48,
                  ).marginOnly(end: AppPadding.p8),
                  Expanded(
                    child: Text(
                      post.user.username,
                      style: StyleManager.getSemiBoldStyle(
                        color: colorOnBackgroundCard,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ),
                  Text(
                    post.dateTime.formatTimeAgo(),
                    style: StyleManager.getMediumStyle(
                      color: colorOnBackgroundCard1,
                    ),
                  ),
                ],
              ).marginOnly(bottom: AppPadding.p4),

              //Image
              _buildImagePost(context, post.images),

              //Content Text
              _buildContentPost(post.textContentPost),

              // Divider
              Divider(color: colorOnBackgroundCard1),

              // Reactions buttons
              ButtonsPost(post: post),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentPost(String text) {
    List<TextSpan> spans = [];
    List<String> parts = text.split(' ');

    for (var part in parts) {
      if (part.startsWith('@') && part.length > 1) {
        spans.add(
          TextSpan(
            text: '$part ',
            style: StyleManager.getBoldStyle(
              color: colorOnBackgroundCard,
              fontSize: FontSize.s16,
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: '$part ',
            style: StyleManager.getMediumStyle(
              color: colorOnBackgroundCard,
              fontSize: FontSize.s16,
            ),
          ),
        );
      }
    }
    return text.isNotEmpty
        ? Text.rich(
            TextSpan(children: spans),
          ).marginOnly(bottom: AppPadding.p4)
        : const SizedBox();
  }

  Widget _buildImagePost(BuildContext context, List<String> images) {
    if (images.isEmpty) return const SizedBox(); // Handle empty images case upfront

    if (post.isSlider) {
      return CustomImageSlider(images: images);
    }

    if (images.length == 1) {
      return _buildSingleImage(context, images.first, context.getHeight * 0.5);
    }

    return SizedBox(child: _buildMultiImage(context, images));
  }

  Widget _buildSingleImage(BuildContext context, String image, double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildMultiImage(BuildContext context, List<String> images) {
    if (images.length == 2) {
      return Row(
        children: [
          Expanded(
            child: _buildSingleImage(context, images.first, context.getHeight * 0.4),
          ),
          const Sw3(),
          Expanded(
            child: _buildSingleImage(context, images.last, context.getHeight * 0.4),
          )
        ],
      );
    }
    if (images.length == 3) {
      return Row(
        children: [
          Expanded(
            child: _buildSingleImage(context, images.first, context.getHeight * 0.4),
          ),
          const Sw2(),
          Expanded(
            child: Column(
              children: [
                _buildSingleImage(context, images[1], context.getHeight * 0.2),
                const Sh2(),
                _buildSingleImage(context, images[2], context.getHeight * 0.2),
              ],
            ),
          )
        ],
      );
    }
    if (images.length > 3) {
      return Row(
        children: [
          Expanded(
            child: _buildSingleImage(context, images.first, context.getHeight * 0.4),
          ),
          const Sw2(),
          Expanded(
            child: Column(
              children: [
                _buildSingleImage(context, images[1], context.getHeight * 0.2),
                const Sh2(),
                SizedBox(
                  height: context.getHeight * 0.2,
                  child: Stack(
                    children: [
                      _buildSingleImage(context, images[2], context.getHeight * 0.2),
                      Container(
                        height: context.getHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
                        ),
                        child: Center(
                          child: Text(
                            "+${images.length - 3}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
    return const SizedBox();
  }
}
