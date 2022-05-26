import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/item_selection/widgets/nft_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemSelectionScreen extends StatefulWidget {
  const ItemSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ItemSelectionScreen> createState() => _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                SFText(keyText: Keys.itemList),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.greyBottomNavBar,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SFText(keyText: Keys.all),
                  const Spacer(),
                  SFText(keyText: Keys.filter),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 160,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return const NFTItem();
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutQuint);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                    // strokeWidth: 5,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutQuint);
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            SFButton(
              text: Keys.cancel,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
