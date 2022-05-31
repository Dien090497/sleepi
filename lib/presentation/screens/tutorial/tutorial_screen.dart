import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final texts = [
    LocaleKeys.howToSetUp,
    LocaleKeys.elevateYourPhone,
    LocaleKeys.trackingRange,
    LocaleKeys.tokenAndSleep,
  ];
  final images = [
    Imgs.tutorial1,
    Imgs.tutorial2,
    Imgs.tutorial3,
    Imgs.tutorial4,
  ];

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tutorialBgr,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.close),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: texts.length,
                controller: _pageController,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      SFText(
                        keyText: texts[i],
                        style: TextStyles.white22Italic,
                      ),
                      Expanded(child: Image.asset(images[i])),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_pageController.page!.round() == texts.length - 1) {
                    Navigator.popUntil(
                        context, (r) => r.settings.name == R.bottomNavigation);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceInOut);
                  }
                },
                child: SFText(
                  keyText: LocaleKeys.next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
