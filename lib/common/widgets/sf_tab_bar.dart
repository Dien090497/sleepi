import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFTabBar extends StatefulWidget {
  const SFTabBar({
    required this.texts,
    this.padding,
    this.isScrollable = false,
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<String> texts;
  final List<Widget> children;
  final EdgeInsets? padding;
  final bool isScrollable;

  @override
  State<SFTabBar> createState() => _SFTabBarState();
}

class _SFTabBarState extends State<SFTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: widget.texts.length, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: List.generate(
            widget.texts.length,
            (i) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: _tabController.index == i
                      ? AppColors.transparent
                      : AppColors.whiteOpacity5,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Tab(text: translate(widget.texts[i]))),
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: AppColors.gradientBluePurple,
          ),
          labelPadding: EdgeInsets.zero,
          labelStyle: TextStyles.white1w700size16,
          unselectedLabelStyle: TextStyles.white1w700size16,
          labelColor: AppColors.light1,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}

// class SFTabBar extends TabBar {
//   SFTabBar({
//     required List<String> texts,
//     EdgeInsets? padding,
//     bool isScrollable = false,
//     Key? key,
//   }) : super(
//           labelStyle: TextStyles.white1w700size16,
//           unselectedLabelStyle: TextStyles.white1w700size16,
//           labelColor: AppColors.light1,
//           // unselectedLabelColor: AppColors.lightGrey,
//           isScrollable: isScrollable,
//           labelPadding: const EdgeInsets.symmetric(horizontal: 8),
//           indicatorPadding: EdgeInsets.zero,
//           tabs: List.generate(
//               texts.length,
//               (i) => Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     // color: AppColors.whiteOpacity5,
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Tab(text: translate(texts[i])))),
//           indicator: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             gradient: AppColors.gradientBluePurple,
//             // color: AppColors.whiteOpacity5,
//           ),
//
//           indicatorSize: TabBarIndicatorSize.label,
//           key: key,
//         );
// }