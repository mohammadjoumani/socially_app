import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/home/domain/entity/post.dart';

class GetPostsUseCase {
  List<PostModel> call(Unit input) {
    return getRandomData();
  }

  List<PostModel> getRandomData() {
    final random = Random();
    final sampleImages = [
      AssetsManager.imgDemo1,
      AssetsManager.imgDemo2,
      AssetsManager.imgDemo3,
      AssetsManager.imgDemo1,
      AssetsManager.imgDemo2,
      AssetsManager.imgDemo3,
    ];
    return [
      PostModel(
        id: 0,
        user: createSampleUser('johndoe', 'John'),
        textContentPost: 'Stopped by @zoesugg today with goosey girl to see @kyliecosmetics & @kylieskin 💕 wow what a dream!!!!!!!!\nIt’s the best experience we have!',
        dateTime: '2024-09-10 15:30:00',
        numberOfLikes: 400,
        numberOfComments: 200,
        isLiked: true,
        isSaved: false,
        images: [],
      ),
      PostModel(
        id: 1,
        user: createSampleUser('johndoe', 'John'),
        textContentPost: 'Had an amazing day with friends at the new cafe! ☕️ #GoodTimes',
        dateTime: '2024-09-21 15:30:00',
        numberOfLikes: 150,
        numberOfComments: 45,
        isLiked: true,
        isSaved: false,
        images: [
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
        ],
      ),
      PostModel(
        id: 2,
        user: createSampleUser('janedoe', 'Jane'),
        textContentPost: 'Just finished an amazing book! 📚 Highly recommended. #BookLovers',
        dateTime: '2024-09-22 10:00:00',
        numberOfLikes: 210,
        numberOfComments: 60,
        isLiked: true,
        isSaved: true,
        images: [
          sampleImages[random.nextInt(sampleImages.length)],
        ],
      ),
      PostModel(
        id: 3,
        user: createSampleUser('alexsmith', 'Alex'),
        textContentPost: '',
        dateTime: '2024-09-23 06:45:00',
        numberOfLikes: 320,
        numberOfComments: 120,
        isLiked: false,
        isSaved: false,
        isSlider: true,
        images: [
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
        ],
      ),
      PostModel(
        id: 4,
        user: createSampleUser('emilyrose', 'Emily'),
        textContentPost: 'Lovely sunset by the beach tonight. 🌅 #NatureLover #Peaceful',
        dateTime: '2024-09-23 18:20:00',
        numberOfLikes: 180,
        numberOfComments: 55,
        isLiked: true,
        isSaved: false,
        images: [],
      ),
      PostModel(
        id: 5,
        user: createSampleUser('chrismiller', 'Chris'),
        textContentPost: 'Tried a new recipe and it was delicious! 🍽️ #Foodie #CookingAtHome',
        dateTime: '2024-09-24 19:00:00',
        numberOfLikes: 140,
        numberOfComments: 30,
        isLiked: false,
        isSaved: true,
        images: [],
      ),
      PostModel(
        id: 6,
        user: createSampleUser('michaelb', 'Michael'),
        textContentPost: 'Game night with the squad! 🎮 Who’s ready for a rematch? #Gaming',
        dateTime: '2024-09-24 21:30:00',
        numberOfLikes: 90,
        numberOfComments: 20,
        isLiked: false,
        isSaved: false,
        images: [],
      ),
      PostModel(
        id: 7,
        user: createSampleUser('sarahk', 'Sarah'),
        textContentPost: 'Just booked my next travel adventure! ✈️ Can’t wait to explore. #Wanderlust',
        dateTime: '2024-09-25 12:00:00',
        numberOfLikes: 240,
        numberOfComments: 85,
        isLiked: true,
        isSaved: false,
        images: [],
      ),
      PostModel(
        id: 8,
        user: createSampleUser('davidl', 'David'),
        textContentPost: 'Hiking through the mountains this weekend. 🥾 Such a great escape. #Adventure',
        dateTime: '2024-09-25 09:30:00',
        numberOfLikes: 110,
        numberOfComments: 40,
        isLiked: true,
        isSaved: true,
        images: [],
      ),
      PostModel(
        id: 9,
        user: createSampleUser('lauraj', 'Laura'),
        textContentPost: 'Morning coffee at my favorite spot. ☕️ #CoffeeAddict #MorningRoutine',
        dateTime: '2024-09-26 08:15:00',
        numberOfLikes: 75,
        numberOfComments: 10,
        isLiked: false,
        isSaved: true,
        images: [],
      ),
      PostModel(
        id: 10,
        user: createSampleUser('brianw', 'Brian'),
        textContentPost: 'New music release this Friday! 🎵 Stay tuned. #MusicLover #NewTracks',
        dateTime: '2024-09-27 14:00:00',
        numberOfLikes: 300,
        numberOfComments: 100,
        isLiked: true,
        isSaved: false,
        isSlider: true,
        images: [
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
          sampleImages[random.nextInt(sampleImages.length)],
        ],
      ),
    ];
  }
}
