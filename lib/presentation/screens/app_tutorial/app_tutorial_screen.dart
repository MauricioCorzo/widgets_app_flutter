import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

class AppTutorialScreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController(initialPage: 0);
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
            // onPageChanged: (value) {
            //   print(value);
            // },
            physics: const BouncingScrollPhysics(),
            children: [
              ...tutorialSlides.map((tutorialSlideData) =>
                  _Slide(tutorialSlideInfo: tutorialSlideData))
            ],
          ),
          // Positioned(
          //   bottom: 20,
          //   left: 0,
          //   right: 0,
          //   // height: 50,
          //   child:
          // ),
          EndTutorialButton(pageViewController: pageViewController)
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

class EndTutorialButton extends StatefulWidget {
  final PageController pageViewController;

  const EndTutorialButton({
    super.key,
    required this.pageViewController,
  });

  @override
  State<EndTutorialButton> createState() => _EndTutorialButtonState();
}

class _EndTutorialButtonState extends State<EndTutorialButton> {
  bool endReached = false;
  int activePage = 0;
  @override
  void initState() {
    super.initState();

    widget.pageViewController.addListener(() {
      final page = widget.pageViewController.page ?? 0;

      if (!this.endReached && page >= (tutorialSlides.length - 1.3)) {
        setState(() {
          this.endReached = true;
        });
      }

      if ((page.round() - page).abs() < 0.2 && activePage != page.round()) {
        setState(() {
          activePage = page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    widget.pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: SmoothPageIndicator(
              controller: widget.pageViewController,
              count: tutorialSlides.length,
              effect: WormEffect(
                  spacing: 16,
                  activeDotColor: colors.primary,
                  dotWidth: 14,
                  dotHeight: 14),
              onDotClicked: (index) {
                widget.pageViewController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: List<Widget>.generate(
          //     tutorialSlides.length,
          //     (index) => Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          //       child: InkWell(
          //         // splashColor: colors.primary,
          //         borderRadius: BorderRadius.circular(8),
          //         onTap: () {
          //           widget.pageViewController.animateToPage(index,
          //               duration: const Duration(milliseconds: 300),
          //               curve: Curves.easeIn);
          //         },
          //         child: CircleAvatar(
          //           radius: 7,
          //           backgroundColor: this.activePage == index
          //               ? colors.primary
          //               : Colors.black26,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Align(
              alignment: AlignmentDirectional.center,
              child: this.endReached
                  ? FadeInRight(
                      from: 15,
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 300),
                      child: FilledButton(
                        onPressed: () => context.pop(),
                        style: const ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size.zero),
                            visualDensity: VisualDensity.compact,
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16))),
                        child: const Text("Start"),
                      ),
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
