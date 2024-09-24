import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/features/generic/presentation/main/bloc/main_bloc.dart';

import 'margin.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _onPressedChangeLanguageButton(context),
      icon: Icon(
        Icons.language,
        color: color,
        size: AppSize.s24,
      ),
    );
  }

  _onPressedChangeLanguageButton(BuildContext context) {
    showLanguageBottomSheet(context);
  }
}

class LanguagesBottomSheet extends StatelessWidget {
  const LanguagesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'العربية',
              style: StyleManager.getRegularStyle(color: colorOnBackgroundCard),
            ),
            onTap: () {
              BlocProvider.of<MainBloc>(context).add(ChangeLanguageToArabicEvent());
              Navigator.pop(context);
            },
            trailing: context.read<MainBloc>().state.locale == arabicLocale ? Icon(Icons.check, color: colorPrimary) : const SizedBox(),
          ),
          ListTile(
            title: Text(
              'English',
              style: StyleManager.getRegularStyle(color: colorOnBackgroundCard),
            ),
            onTap: () {
              BlocProvider.of<MainBloc>(context).add(ChangeLanguageToEnglishEvent());
              Navigator.pop(context);
            },
            trailing: context.read<MainBloc>().state.locale == englishLocale ? Icon(Icons.check, color: colorPrimary) : const SizedBox(),
          ),
          const Sh4(),
        ],
      ),
    );
  }
}

showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    enableDrag: true,
    useSafeArea: true,
    builder: (_) => const LanguagesBottomSheet(),
  );
}
