import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/margin.dart';
import 'package:socially_app/features/comment/presentation/bloc/comments_bloc.dart';

import 'add_comment.dart';
import 'item_comment.dart';

class CommentsViewBody extends StatelessWidget {
  const CommentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<CommentsBloc, CommentsState>(
            buildWhen: (previous, current) => previous.getCommentsDataState != current.getCommentsDataState,
            builder: (context, state) {
              return ListView.separated(
                itemBuilder: (context, index) => ItemComment(comment: state.comments[index]),
                separatorBuilder: (context, index) => const Sh4(),
                itemCount: state.comments.length,
                padding: const EdgeInsets.all(AppPadding.p16),
              );
            },
          ),
        ),
        const AddComment(),
      ],
    );
  }
}
