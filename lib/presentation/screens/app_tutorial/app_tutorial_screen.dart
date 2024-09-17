import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TutorialSlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  TutorialSlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final tutorialSlides = <TutorialSlideInfo>[
  TutorialSlideInfo(
      title: 'You search the food',
      caption:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus quia in et magnam ipsa ex, voluptatem voluptates illo commodi consequatur sit quaerat quo similique debitis! Eligendi neque alias optio laborum!',
      imageUrl: 'assets/images/1.png'),
  TutorialSlideInfo(
      title: 'We deliver it fast',
      caption:
          'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Asperiores odio totam praesentium sed? Voluptas minima adipisci, consequuntur eius culpa aliquid corrupti officiis. Eaque neque id blanditiis? Voluptas id dolore labore.',
      imageUrl: 'assets/images/2.png'),
  TutorialSlideInfo(
      title: 'And enjoy your meal',
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores ratione neque fugiat odio ipsam esse, inventore pariatur, corrupti at, voluptas et animi blanditiis! Debitis magnam quod voluptas ipsam vel alias?',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = this.pageViewController.page ?? 0;

      if (!this.endReached && page >= (tutorialSlides.length - 1.3)) {
        setState(() {
          this.endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("Exit"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...tutorialSlides.map((tutorialSlideData) =>
                  _Slide(tutorialSlideInfo: tutorialSlideData))
            ],
          ),
          this.endReached
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      style: const ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(Size.zero),
                          visualDensity: VisualDensity.compact,
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12))),
                      child: const Text("Start"),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final TutorialSlideInfo tutorialSlideInfo;
  const _Slide({required this.tutorialSlideInfo});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(this.tutorialSlideInfo.imageUrl)),
            const SizedBox(height: 20),
            Text(
              this.tutorialSlideInfo.title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              this.tutorialSlideInfo.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
