import 'package:flutter/material.dart';

import 'posts_section.dart';
import 'stories_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: StoriesSection(),
        ),
        PostsSection(),
        // SliverToBoxAdapter(
        //   child: Sh4(),
        // ),
      ],
    );
  }
}
