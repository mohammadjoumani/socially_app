import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/comment/domain/entity/comment.dart';

class GetCommentsUseCase {
  List<Comment> call(Unit input) {
    return getRandomComment();
  }

  List<Comment> getRandomComment() {
    final random = Random();
    return [
      Comment(
        id: 1,
        user: createSampleUser('johndoe', 'John'),
        contentComment: 'Great post! I really enjoyed reading this.',
        dateTime: '2024-09-10 15:30:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
        replies: [
          ReplyComment(
            user: createSampleUser('janedoe', 'Jane'),
            replyComment: 'Glad you liked it, John!',
          ),
          ReplyComment(
            user: createSampleUser('alice', 'Alice'),
            replyComment: 'Agreed, it’s a great post!',
          ),
        ],
      ),
      Comment(
        id: 2,
        user: createSampleUser('janedoe', 'Jane'),
        contentComment: 'Thanks for sharing this information.',
        dateTime: '2024-09-21 15:30:00',
        numberOfLikes: random.nextInt(100),
        isLiked: true,
      ),
      Comment(
        id: 3,
        user: createSampleUser('alice', 'Alice'),
        contentComment: 'Can you provide more details on this topic?',
        dateTime: '2024-09-22 10:00:00',
        numberOfLikes: random.nextInt(100),
        isLiked: true,
      ),
      Comment(
        id: 4,
        user: createSampleUser('bob', 'Bob'),
        contentComment: 'This was very helpful, thank you!',
        dateTime: '2024-09-23 06:45:00',
        numberOfLikes: random.nextInt(100),
        isLiked: true,
      ),
      Comment(
        id: 5,
        user: createSampleUser('charlie', 'Charlie'),
        contentComment: 'I disagree with some points here, but still a good read.',
        dateTime: '2024-09-23 18:20:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
        replies: [
          ReplyComment(
            user: createSampleUser('eve', 'Eve'),
            replyComment: 'Interesting perspective, Charlie.',
          ),
        ],
      ),
      Comment(
        id: 6,
        user: createSampleUser('david', 'David'),
        contentComment: 'Looking forward to more posts like this!',
        dateTime: '2024-09-24 18:00:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
      ),
      Comment(
        id: 7,
        user: createSampleUser('eve', 'Eve'),
        contentComment: 'This is insightful, thanks for posting.',
        dateTime: '2024-09-24 19:00:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
      ),
      Comment(
        id: 8,
        user: createSampleUser('frank', 'Frank'),
        contentComment: 'I found this content very useful.',
        dateTime: '2024-09-24 21:30:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
        replies: [
          ReplyComment(
            user: createSampleUser('grace', 'Grace'),
            replyComment: 'Glad it was helpful, Frank!',
          ),
        ],
      ),
      Comment(
        id: 9,
        user: createSampleUser('grace', 'Grace'),
        contentComment: 'I’ve been looking for this kind of information, great!',
        dateTime: '2024-09-25 12:00:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
      ),
      Comment(
        id: 10,
        user: createSampleUser('hannah', 'Hannah'),
        contentComment: 'Awesome write-up! Keep up the good work.',
        dateTime: '2024-09-25 09:30:00',
        numberOfLikes: random.nextInt(100),
        isLiked: false,
      ),
    ];
  }
}
