import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/extension/extensions.dart';
import 'package:socially_app/core/utils/extension/widget_extension.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({super.key, required this.images});

  final List<String> images;

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  final PageController _pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: context.getHeight * 0.5,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) => _itemImage(widget.images[index]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.images.length; i++) DotWidget(currentIndex: i, index: index),
          ],
        ).marginOnly(bottom: AppPadding.p16),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _itemImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.fill,
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s10,
      width: AppSize.s10,
      margin: const EdgeInsets.only(right: AppPadding.p4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        color: currentIndex == index ? colorPrimary : colorHintText,
      ),
    );
  }
}
