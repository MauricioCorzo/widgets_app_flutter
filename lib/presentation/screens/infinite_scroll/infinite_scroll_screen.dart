import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final scrollController = ScrollController();
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = false;

  @override
  void initState() {
    super.initState();
    this.isMounted = true;
    this.scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 310,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> onRefreshImages() async {
    await Future.delayed(const Duration(seconds: 3));

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    if (!isMounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: this.onRefreshImages,
              strokeWidth: 2,
              edgeOffset: 10,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: this.scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage("assets/images/jar-loading.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/id/${imagesIds[index]}/500/300"),
                  );
                },
              ),
            ),
            Positioned.fill(
                bottom: 20,
                child: this.isLoading
                    ? SlideInUp(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            width: 50,
                            height: 50,
                            child: SpinPerfect(
                              infinite: true,
                              child: const Icon(Icons.refresh_rounded),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
