import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/extension/extensions.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/string_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/core/utils/widgets/custom_text_field.dart';
import 'package:socially_app/features/comment/presentation/bloc/comments_bloc.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final TextEditingController controller = TextEditingController();
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: CustomTextField(
        controller: controller,
        hintText: AppStrings.strWriteComment.tr(context),
        onChanged: (value) {
          setState(() {
            enable = value.isNotEmpty;
          });
        },
        suffixIcon: IconButton(
          onPressed: () {
            if (enable) {
              final contentComment = controller.text;
              controller.clear();
              context.dismissKeyboard();
              context.read<CommentsBloc>().add(AddCommentEvent(contentComment: contentComment));
            }
          },
          icon: Icon(
            Icons.send,
            color: enable ? colorPrimary : colorPrimary.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
