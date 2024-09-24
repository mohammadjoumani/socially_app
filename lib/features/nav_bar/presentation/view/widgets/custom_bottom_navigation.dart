import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/utils/resource/assets_manager.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';
import 'package:socially_app/features/nav_bar/presentation/bloc/nav_bar_bloc.dart';

import 'custom_item_bottom_navigation.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return BottomAppBar(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.p32,
              vertical: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              color: colorBackgroundCard,
              borderRadius: const BorderRadiusDirectional.vertical(
                top: Radius.circular(AppSize.s16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomItemBottomNavigation(
                  icon: AssetsManager.icTabHome,
                  label: '',
                  isSelected: state.index == 0,
                  onTap: () {
                    context.read<NavBarBloc>().add(ChangeNavBarIndexEvent(index: 0));
                  },
                ),
                CustomItemBottomNavigation(
                  icon: AssetsManager.icTabExplore,
                  label: '',
                  isSelected: state.index == 1,
                  onTap: () {
                    context.read<NavBarBloc>().add(ChangeNavBarIndexEvent(index: 1));
                  },
                ),
                CustomItemBottomNavigation(
                  icon: AssetsManager.icTabProfile,
                  label: '',
                  isSelected: state.index == 2,
                  onTap: () {
                    context.read<NavBarBloc>().add(ChangeNavBarIndexEvent(index: 2));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
