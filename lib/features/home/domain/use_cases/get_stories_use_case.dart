import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/home/domain/entity/story.dart';

class GetStoriesUseCase {
  List<StoryModel> call(Unit input) {
    return getRandomStories();
  }

  List<StoryModel> getRandomStories() {
    final random = Random();
    final sampleImages = [
      AssetsManager.imgDemo1,
      AssetsManager.imgDemo2,
      AssetsManager.imgDemo3,
      AssetsManager.imgDemo1,
      AssetsManager.imgDemo2,
      AssetsManager.imgDemo3,
    ];

    final sampleTexts = [
      "Had a great day!",
      "Amazing views at the beach.",
      "Enjoying a cozy evening.",
      "Check out my latest adventure.",
      "Loving the new look!",
      "Just finished a workout!",
    ];

    return [
      StoryModel(
        id: 1,
        user: createSampleUser('johndoe', 'John Doe'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
          StoryChild(
            text: sampleTexts[random.nextInt(sampleTexts.length)],
          ),
        ],
      ),
      StoryModel(
        id: 2,
        user: createSampleUser('janedoe', 'Jane Doe'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
          StoryChild(
            text: sampleTexts[random.nextInt(sampleTexts.length)],
          ),
        ],
      ),
      StoryModel(
        id: 3,
        user: createSampleUser('alice', 'Alice'),
        children: [
          StoryChild(
            text: sampleTexts[random.nextInt(sampleTexts.length)],
          ),
          StoryChild(
            text: sampleTexts[random.nextInt(sampleTexts.length)],
          ),
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
        ],
      ),
      StoryModel(
        id: 4,
        user: createSampleUser('bob', 'Bob'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
        ],
      ),
      StoryModel(
        id: 5,
        user: createSampleUser('charlie', 'Charlie'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
        ],
      ),
      StoryModel(
        id: 6,
        user: createSampleUser('david', 'David'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
          StoryChild(
            text: sampleTexts[random.nextInt(sampleTexts.length)],
          ),
        ],
      ),
      StoryModel(
        id: 7,
        user: createSampleUser('eve', 'Eve'),
        children: [
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
          StoryChild(
            image: sampleImages[random.nextInt(sampleImages.length)],
          ),
        ],
      ),
    ];
  }
}
