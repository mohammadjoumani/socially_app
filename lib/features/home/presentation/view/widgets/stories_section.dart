import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/image_network_widget.dart';
import 'package:socially_app/features/home/domain/entity/story.dart';
import 'package:socially_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_story/flutter_story.dart';

class StoriesSection extends StatefulWidget {
  const StoriesSection({super.key});

  @override
  State<StoriesSection> createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {
  StoryController storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.getStoriesDataState != current.getStoriesDataState,
      builder: (context, state) {
        return Container(
          height: 100,
          margin: const EdgeInsets.all(AppPadding.p16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s80),
            color: colorOnBackgroundCard.withOpacity(0.5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s80),
            child: Story.builder(
              controller: storyController,
              itemCount: state.stories.length,
              itemBuilder: (context, index) => StoryUser(
                width: AppSize.s80,
                height: AppSize.s80,
                label: Text(state.stories[index].user.username),
                avatar: ImageNetworkWidget(
                  imageUrl: state.stories[index].user.image,
                  imageSize: AppSize.s48,
                  imageRadius: AppSize.s48,
                ),
                borderColor: Colors.green,
                borderPadding: const EdgeInsets.all(0),
                children: state.stories[index].children.map((child) {
                  return StoryCard(
                    visited: child.visited,
                    onVisited: (index) {
                      setState(() {
                        child.visited = true;
                      });
                    },
                    child: child.text != null ? storyText(child) : storyImage(child),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget storyText(StoryChild child) {
    return Container(
      color: child.backgroundColor,
      child: Center(
        child: Text(
          child.text!,
          style: StyleManager.getMediumStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget storyImage(StoryChild child) {
    return SizedBox(
      child: Center(
        child: Image.asset(
          child.image!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    storyController.dispose();
  }
}
