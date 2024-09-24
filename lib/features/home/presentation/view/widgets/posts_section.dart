import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/widgets/margin.dart';
import 'package:socially_app/features/home/presentation/bloc/home_bloc.dart';

import 'item_post.dart';

class PostsSection extends StatelessWidget {
  const PostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.getPostsDataState != current.getPostsDataState,
      builder: (context, state) {
        return SliverList.separated(
          itemBuilder: (context, index) => ItemPost(post: state.posts[index]),
          separatorBuilder: (context, index) => const Sh4(),
          itemCount: state.posts.length,
        );
      },
    );
  }
}
